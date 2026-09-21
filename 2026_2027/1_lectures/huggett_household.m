function [a, info] = huggett_household(q, par, numerics)
% HUGGETT_HOUSEHOLD Solve a two-period household's bond demand at a given price.
%
% INPUTS:
% q:        Positive scalar price of a bond paying one unit next period
% par:      Scalar structure with preferences, incomes, probabilities and aMin
% numerics: Scalar structure with household root tolerance and boundary offset
%
% OUTPUTS:
% a:    Scalar optimal bond payoff (positive for lending)
% info: Structure with consumption, Euler residual and constraint diagnostics

validateattributes(q, {'double'}, {'scalar','real','finite','positive'});
assert(par.beta > 0 && par.sigma > 0 && par.y1 > 0, ...
    'Discounting, risk aversion and current income must be positive.');
y2 = par.y2(:);
prob = par.prob(:);
assert(numel(y2) == numel(prob) && all(y2 > 0) && ...
    all(prob > 0) && abs(sum(prob) - 1) < 1e-12, ...
    'Use positive incomes and probabilities that sum to one.');

% Strictly positive consumption: -min(y2) < a < y1/q.
naturalLimit = -min(y2);
upperLimit = par.y1 / q;
lowerLimit = max(naturalLimit, par.aMin);
assert(lowerLimit < upperLimit, 'There is no feasible consumption choice.');
offset = numerics.boundaryFraction * (upperLimit - lowerLimit);
lower = max(naturalLimit + offset, par.aMin);
upper = upperLimit - offset;
assert(lower < upper, 'The numerical feasibility interval is empty.');

% This is the derivative of lifetime utility with respect to bond holdings.
derivative = @(assets) -q * (par.y1 - q * assets)^(-par.sigma) ...
    + par.beta * sum(prob .* (y2 + assets).^(-par.sigma));
binding = isfinite(par.aMin) && par.aMin > naturalLimit ...
    && derivative(par.aMin) <= 0;

if binding
    a = par.aMin;
else
    assert(derivative(lower) > 0 && derivative(upper) < 0, ...
        'Root not bracketed: reduce numerics.boundaryFraction.');
    options = optimset('TolX', numerics.householdTol, 'Display', 'off');
    [a, ~, exitflag] = fzero(derivative, [lower, upper], options);
    assert(exitflag > 0 && isfinite(a), 'Household root solver failed.');
end

info.c1 = par.y1 - q * a;
info.c2 = y2 + a;
lhs = q * info.c1^(-par.sigma);
rhs = par.beta * sum(prob .* info.c2.^(-par.sigma));
info.eulerResidual = (rhs - lhs) / max(lhs, rhs);
info.binding = binding;
info.naturalLimit = naturalLimit;
assert(info.c1 > 0 && all(info.c2 > 0), 'Consumption must be positive.');
end %end function

function [a, c1, c2] = huggett_household(R, par)
% HUGGETT_HOUSEHOLD Household saving at a given gross interest rate.
%
% The household chooses a, the payoff of the bond next period.
% Buying a units of future payoff costs a/R today.
%
% c1 = y1 - a/R
% c2 = y2 + a

% Feasible interval for a.
lower = max(par.aMin, -min(par.y2) + 1e-8);
upper = R * par.y1 - 1e-8;

% Euler equation written as RHS - LHS:
% beta*R*E[u'(c2)] - u'(c1) = 0.
euler = @(a) par.beta * R * sum(par.prob .* (par.y2 + a).^(-par.sigma)) ...
    - (par.y1 - a / R)^(-par.sigma);

% If the borrowing constraint binds, choose the lower bound.
% Otherwise solve the Euler equation.
if euler(lower) <= 0
    a = lower;
else
    a = fzero(euler, [lower, upper]);
end

c1 = par.y1 - a / R;
c2 = par.y2 + a;

end

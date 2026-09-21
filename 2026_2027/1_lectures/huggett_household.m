function [a, c1, c2] = huggett_household(R, par)
% HUGGETT_HOUSEHOLD Household saving at a given gross interest rate.
%
% The household chooses a, the payoff of the bond next period.
% Buying a units of future payoff costs a/R today.
%
% c1 = y1 - a/R
% c2 = y2 + a

% Feasible interval for a: consumption must be positive in every state.
lower = -min(par.y2) + 1e-8;
upper = R * par.y1 - 1e-8;

% Euler equation written as RHS - LHS:
% beta*R*E[u'(c2)] - u'(c1) = 0.
euler = @(a) par.beta * R * sum(par.prob .* (par.y2 + a).^(-par.sigma)) ...
    - (par.y1 - a / R)^(-par.sigma);

a = fzero(euler, [lower, upper]);

c1 = par.y1 - a / R;
c2 = par.y2 + a;

end

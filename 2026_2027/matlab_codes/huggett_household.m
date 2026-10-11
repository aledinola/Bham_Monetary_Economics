function [a, c1, c2] = huggett_household(R, par)
% HUGGETT_HOUSEHOLD Household saving at a given gross interest rate.
%
% INPUTS:
% R:   Scalar gross interest rate
% par: Structure with preferences, scalar current income, and equally sized
%      future-income and probability column vectors
%
% OUTPUTS:
% a:  Scalar saving today; the bond pays R*a next period
% c1: Scalar current consumption, y1 - a
% c2: Future consumption column vector, y2 + R*a (same size as par.y2)

% Feasible interval for a: consumption must be positive in every state.
lower = -min(par.y2) / R + 1e-8;
upper = par.y1 - 1e-8;

% Euler equation written as RHS - LHS:
% beta*R*E[u'(c2)] - u'(c1) = 0.
euler = @(a) par.beta * R * sum(par.prob .* (par.y2 + R*a).^(-par.sigma)) ...
    - (par.y1 - a)^(-par.sigma);

a = fzero(euler, [lower, upper]);

c1 = par.y1 - a;
c2 = par.y2 + R*a;

end %end function

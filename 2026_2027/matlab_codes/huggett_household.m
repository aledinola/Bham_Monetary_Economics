function [a, c1, c2_L, c2_H] = huggett_household(R, par)
% HUGGETT_HOUSEHOLD Household saving at a given gross interest rate.
%
% INPUTS:
% R:   Scalar gross interest rate
% par: Structure with preferences, scalar current income, ordered scalar
%      future incomes y2_L <= y2_H, and low-state probability prob_L
%
% OUTPUTS:
% a:    Scalar saving today; the bond pays R*a next period
% c1:   Scalar current consumption, y1 - a
% c2_L: Scalar future consumption in the low-income state, y2_L + R*a
% c2_H: Scalar future consumption in the high-income state, y2_H + R*a

prob_L = par.prob_L;
y1     = par.y1;
y2_L   = par.y2_L;
y2_H   = par.y2_H;
sigma  = par.sigma;
beta   = par.beta;

% Feasible interval for a: consumption must be positive in every state.
lower = -y2_L / R + 1e-8;
upper = y1 - 1e-8;

% Euler equation written as RHS - LHS:
% beta*R*E[u'(c2)] - u'(c1) = 0.
% Expected marginal utility is prob_L*u'(c2_L) + (1-prob_L)*u'(c2_H).
euler = @(a) beta * R * ...
    (prob_L * (y2_L + R*a)^(-sigma) + ...
     (1-prob_L) * (y2_H + R*a)^(-sigma)) ...
    - (y1 - a)^(-sigma);

a = fzero(euler, [lower, upper]);

c1 = y1 - a;
c2_L = y2_L + R*a;
c2_H = y2_H + R*a;

end %end function

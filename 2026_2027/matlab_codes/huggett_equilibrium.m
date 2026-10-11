function [R, a, c1, c2] = huggett_equilibrium(par)
% HUGGETT_EQUILIBRIUM Find the gross interest rate that clears the bond market.
%
% INPUTS:
% par: Structure with preferences, scalar current income, and equally sized
%      future-income and probability column vectors
%
% OUTPUTS:
% R:  Scalar equilibrium gross interest rate
% a:  Scalar saving today; zero net bond supply requires a = 0
% c1: Scalar current consumption
% c2: Future consumption column vector (same size as par.y2)
%
% Bisection stops when abs(a) < 1e-10, with at most 100 iterations.

Rlow = 0.2;
Rhigh = 3.0;
tol = 1e-10;

for iter = 1:100

    R = (Rlow + Rhigh) / 2;
    [a, c1, c2] = huggett_household(R, par);

    if abs(a) < tol
        return
    end

    % If households want to save, R is too high.
    % If households want to borrow, R is too low.
    if a > 0
        Rhigh = R;
    else
        Rlow = R;
    end

end

end %end function

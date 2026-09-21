function [R, a, c1, c2] = huggett_equilibrium(par)
% HUGGETT_EQUILIBRIUM Find the gross interest rate that clears the bond market.
%
% Bonds are in zero net supply, so equilibrium requires a = 0.

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

end

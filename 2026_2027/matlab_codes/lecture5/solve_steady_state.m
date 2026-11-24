function ss = solve_steady_state(par)
% SOLVE_STEADY_STATE Compute the deterministic zero-inflation steady state.
%
% INPUTS:
% par: Scalar structure with preferences, technology, D and the rate i_star.
%
% OUTPUTS:
% ss: Scalar structure with the ten steady-state values and gross rate R.

ss.Z = 1;
ss.v = 0;
ss.N = ((1 - par.alpha) / par.chi)^(1 / par.D);
ss.Y = ss.Z * ss.N^(1 - par.alpha);
ss.C = ss.Y;
ss.w = (1 - par.alpha) * ss.Z * ss.N^(-par.alpha);

ss.Pi = 1;                           % Gross inflation
ss.r = 1 / par.beta - 1;             % Net real interest rate
ss.i = par.i_star;                   % Net nominal interest rate
ss.R = 1 + ss.i;                     % Gross nominal interest rate
ss.m = ss.C^par.sigma / (1 - par.beta);
end %end function

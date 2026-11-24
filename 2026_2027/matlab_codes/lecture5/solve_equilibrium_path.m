function path = solve_equilibrium_path(par, ss, u_z, u_v, z_initial, v_initial)
% SOLVE_EQUILIBRIUM_PATH Compute the response to a sequence of innovations.
%
% INPUTS:
% par: Scalar structure with the parameters and coefficients from main.m.
% ss: Scalar steady-state structure returned by solve_steady_state.
% u_z, u_v: Equal-length T-element vectors of realized TFP and policy
%           innovations, respectively. The first element is quarter 0.
% z_initial, v_initial: Scalar states in the quarter before the first shock.
%
% OUTPUTS:
% path: Structure of T-by-1 series. z and all _hat fields are log deviations.
%       I_hat is the log deviation of the gross nominal rate I_t = 1 + i_t.
%       E_R_hat gives the expected log deviation of the gross real rate.
%       pi is net inflation and v is the policy disturbance, both in decimals.

assert(isvector(u_z) && isvector(u_v) && numel(u_z) == numel(u_v), ...
       'Supply two innovation vectors of the same length.');

% 1. Update the two states using the innovations supplied by the caller.
T = numel(u_z);
z = zeros(T,1);
v = zeros(T,1);

% MATLAB index 1 is quarter 0, when the first innovation arrives.
if T > 0
    z(1) = par.rho_z * z_initial + u_z(1);
    v(1) = par.rho_v * v_initial + u_v(1);
end
for t = 2:T
    z(t) = par.rho_z * z(t-1) + u_z(t);
    v(t) = par.rho_v * v(t-1) + u_v(t);
end
path.z = z;
path.v = v;

% 2. The real allocation is exact in logs. The Euler equation gives the
%    gross expected real return to first order via expected consumption growth.
path.N_hat = (1 - par.sigma) / par.D * z;
path.C_hat = par.b * z;
path.Y_hat = path.C_hat;
path.w_hat = (par.psi + par.sigma) / par.D * z;
path.E_R_hat = par.sigma * par.b * (par.rho_z - 1) * z;

% 3. First-order inflation, gross nominal return and real money demand.
path.pi = par.a_z * z + par.a_v * v;
path.I_hat = (par.phi_pi * path.pi + v) / ss.I;
path.m_hat = par.sigma * path.C_hat - path.I_hat / ss.i;

end %end function

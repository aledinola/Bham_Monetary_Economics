% Lecture 5: Classical Monetary Theory
% Run this script from the lecture5 folder. Each period is one quarter.

clear,clc,close all

%% Parameters
par.alpha  = 0.33;   % Output elasticity of labour is 1 - alpha
par.beta   = 0.99;   % Discount factor
par.sigma  = 2;      % Relative risk aversion; try 1 for constant hours
par.psi    = 1;      % Inverse Frisch elasticity of labour supply
par.chi    = 1;      % Scale of the disutility of work
par.rho_z  = 0.9;    % Persistence of log productivity
par.rho_v  = 0.5;    % Persistence of the monetary policy disturbance
par.phi_pi = 1.5;    % Response of the nominal rate to net inflation

par.D = par.psi + par.alpha + par.sigma * (1 - par.alpha);
par.b = (1 + par.psi) / par.D;    % Elasticity of consumption to productivity
par.i_star = 1 / par.beta - 1;    % Rate the central bank sets at pi = v = 0

%% Steady state and coefficients of the inflation solution
ss = solve_steady_state(par);
par.kappa = par.phi_pi / ss.I;
assert(par.kappa > 1, 'The solution assumes an active rule: phi_pi / ss.I > 1.');

% Inflation is a_z * z + a_v * v to first order (Section 4.2).
par.a_z = par.sigma * par.b * (par.rho_z - 1) / (par.kappa - par.rho_z);
par.a_v = -1 / (ss.I * (par.kappa - par.rho_v));

%% Impulse responses from steady state
T = 40;
quarter = (0:T-1)';
no_shock = zeros(T,1);

u_z = no_shock;
u_z(1) = 0.01;       % About a 1% rise in productivity at quarter 0
irf_tfp = solve_equilibrium_path(par, ss, u_z, no_shock, 0, 0);

u_v = no_shock;
u_v(1) = 0.001;      % 10 basis points in the interest-rate rule at quarter 0
irf_policy = solve_equilibrium_path(par, ss, no_shock, u_v, 0, 0);

%% Plot responses to a TFP innovation
figure('Name', 'TFP innovation', 'Color', 'white', ...
       'Position', [100 100 1100 780]);
layout = tiledlayout(3,3, 'TileSpacing', 'compact', 'Padding', 'compact');
title(layout, 'TFP innovation');
xlabel(layout, 'Quarters after the innovation');

nexttile;
plot(quarter, 100 * irf_tfp.z, 'LineWidth', 1.6);
title('Productivity');
ylabel('Log deviation (%)');
yline(0, ':', 'Color', [0.5 0.5 0.5], 'Layer', 'bottom');
xlim([0 T-1]);

nexttile;
plot(quarter, 100 * irf_tfp.v, 'LineWidth', 1.6);
title('Monetary policy disturbance');
ylabel('Percentage points');
yline(0, ':', 'Color', [0.5 0.5 0.5], 'Layer', 'bottom');
xlim([0 T-1]);

% Goods market clearing gives Y_hat = C_hat, so one line shows both.
nexttile;
plot(quarter, 100 * irf_tfp.Y_hat, 'LineWidth', 1.6);
title('Output and consumption');
ylabel('Log deviation (%)');
yline(0, ':', 'Color', [0.5 0.5 0.5], 'Layer', 'bottom');
xlim([0 T-1]);

nexttile;
plot(quarter, 100 * irf_tfp.N_hat, 'LineWidth', 1.6);
title('Hours');
ylabel('Log deviation (%)');
yline(0, ':', 'Color', [0.5 0.5 0.5], 'Layer', 'bottom');
xlim([0 T-1]);

nexttile;
plot(quarter, 100 * irf_tfp.w_hat, 'LineWidth', 1.6);
title('Real wage');
ylabel('Log deviation (%)');
yline(0, ':', 'Color', [0.5 0.5 0.5], 'Layer', 'bottom');
xlim([0 T-1]);

nexttile;
plot(quarter, 100 * irf_tfp.E_R_hat, 'LineWidth', 1.6);
title('Expected gross real return');
ylabel('Log deviation (%)');
yline(0, ':', 'Color', [0.5 0.5 0.5], 'Layer', 'bottom');
xlim([0 T-1]);

nexttile;
plot(quarter, 100 * irf_tfp.I_hat, 'LineWidth', 1.6);
title('Gross nominal interest rate');
ylabel('Log deviation (%)');
yline(0, ':', 'Color', [0.5 0.5 0.5], 'Layer', 'bottom');
xlim([0 T-1]);

nexttile;
plot(quarter, 100 * irf_tfp.pi, 'LineWidth', 1.6);
title('Net inflation');
ylabel('Percentage points');
yline(0, ':', 'Color', [0.5 0.5 0.5], 'Layer', 'bottom');
xlim([0 T-1]);

nexttile;
plot(quarter, 100 * irf_tfp.m_hat, 'LineWidth', 1.6);
title('Real money balances');
ylabel('Log deviation (%)');
yline(0, ':', 'Color', [0.5 0.5 0.5], 'Layer', 'bottom');
xlim([0 T-1]);

%% Plot responses to a monetary policy innovation
figure('Name', 'Innovation to the central bank''s interest-rate rule', 'Color', 'white', ...
       'Position', [100 100 1100 780]);
layout = tiledlayout(3,3, 'TileSpacing', 'compact', 'Padding', 'compact');
title(layout, 'Innovation to the central bank''s interest-rate rule');
xlabel(layout, 'Quarters after the innovation');

nexttile;
plot(quarter, 100 * irf_policy.z, 'LineWidth', 1.6);
title('Productivity');
ylabel('Log deviation (%)');
yline(0, ':', 'Color', [0.5 0.5 0.5], 'Layer', 'bottom');
xlim([0 T-1]);

nexttile;
plot(quarter, 100 * irf_policy.v, 'LineWidth', 1.6);
title('Monetary policy disturbance');
ylabel('Percentage points');
yline(0, ':', 'Color', [0.5 0.5 0.5], 'Layer', 'bottom');
xlim([0 T-1]);

% Goods market clearing gives Y_hat = C_hat, so one line shows both.
nexttile;
plot(quarter, 100 * irf_policy.Y_hat, 'LineWidth', 1.6);
title('Output and consumption');
ylabel('Log deviation (%)');
yline(0, ':', 'Color', [0.5 0.5 0.5], 'Layer', 'bottom');
xlim([0 T-1]);

nexttile;
plot(quarter, 100 * irf_policy.N_hat, 'LineWidth', 1.6);
title('Hours');
ylabel('Log deviation (%)');
yline(0, ':', 'Color', [0.5 0.5 0.5], 'Layer', 'bottom');
xlim([0 T-1]);

nexttile;
plot(quarter, 100 * irf_policy.w_hat, 'LineWidth', 1.6);
title('Real wage');
ylabel('Log deviation (%)');
yline(0, ':', 'Color', [0.5 0.5 0.5], 'Layer', 'bottom');
xlim([0 T-1]);

nexttile;
plot(quarter, 100 * irf_policy.E_R_hat, 'LineWidth', 1.6);
title('Expected gross real return');
ylabel('Log deviation (%)');
yline(0, ':', 'Color', [0.5 0.5 0.5], 'Layer', 'bottom');
xlim([0 T-1]);

nexttile;
plot(quarter, 100 * irf_policy.I_hat, 'LineWidth', 1.6);
title('Gross nominal interest rate');
ylabel('Log deviation (%)');
yline(0, ':', 'Color', [0.5 0.5 0.5], 'Layer', 'bottom');
xlim([0 T-1]);

nexttile;
plot(quarter, 100 * irf_policy.pi, 'LineWidth', 1.6);
title('Net inflation');
ylabel('Percentage points');
yline(0, ':', 'Color', [0.5 0.5 0.5], 'Layer', 'bottom');
xlim([0 T-1]);

nexttile;
plot(quarter, 100 * irf_policy.m_hat, 'LineWidth', 1.6);
title('Real money balances');
ylabel('Log deviation (%)');
yline(0, ':', 'Color', [0.5 0.5 0.5], 'Layer', 'bottom');
xlim([0 T-1]);

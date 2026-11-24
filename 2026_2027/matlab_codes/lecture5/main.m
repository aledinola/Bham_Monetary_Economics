% Lecture 5: Classical Monetary Theory
% Run this script from the lecture5 folder. Each period is one quarter.

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
par.kappa = par.phi_pi / ss.R;
assert(par.kappa > 1, 'The solution assumes an active rule: phi_pi / R_ss > 1.');

% Inflation is a_z * z + a_v * v to first order (Section 4.2).
par.a_z = par.sigma * par.b * (par.rho_z - 1) / (par.kappa - par.rho_z);
par.a_v = -1 / (ss.R * (par.kappa - par.rho_v));

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

%% Plot both experiments using the same panel order
responses = {irf_tfp, irf_policy};
figure_titles = {'TFP innovation', 'Innovation to the central bank''s interest-rate rule'};
panel_titles = {'Productivity', 'Monetary policy disturbance', 'Output and consumption', ...
                'Hours', 'Real wage', 'Gross real return', ...
                'Gross nominal return', 'Net inflation', 'Real money balances'};
units = {'Log deviation (%)', 'Percentage points', 'Log deviation (%)', ...
         'Log deviation (%)', 'Log deviation (%)', 'Log deviation (%)', ...
         'Log deviation (%)', 'Percentage points', 'Log deviation (%)'};

for experiment = 1:2
    irf = responses{experiment};
    % Output and consumption coincide at every date, so one line shows both.
    series = [irf.z, irf.v, irf.Y_hat, irf.N_hat, irf.w_hat, ...
              irf.R_real_hat, irf.R_hat, irf.pi, irf.m_hat];

    figure('Name', figure_titles{experiment}, 'Color', 'white', ...
           'Position', [100 100 1100 780]);
    layout = tiledlayout(3,3, 'TileSpacing', 'compact', 'Padding', 'compact');
    title(layout, figure_titles{experiment});
    xlabel(layout, 'Quarters after the innovation');
    for panel = 1:size(series,2)
        nexttile;
        plot(quarter, 100 * series(:,panel), 'LineWidth', 1.6);
        yline(0, ':', 'Color', [0.5 0.5 0.5], 'Layer', 'bottom');
        xlim([0 T-1]);
        title(panel_titles{panel});
        ylabel(units{panel});
    end
end

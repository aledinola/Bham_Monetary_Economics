% Assignment Workshop: A Two-Period Economy with Income Risk
% Run this script in full. All helper functions are at the end of the file.
clear, clc, close all

%% 1. Parameters (the assignment's baseline)
beta  = 0.95^20;
sigma = 2;
alpha = 0.36;
y     = 1;
prob  = 0.5;                 % pi: probability of the low productivity state
risk  = 0.1;                 % epsilon: dispersion of labour productivity
weight_old = 0.9;            % lambda: weight on the previous capital guess
export_figures = false;      % Optional: save the two diagrams as PDF files

%% 2. Competitive equilibrium by damped capital iteration
baseline = solve_equilibrium(beta,sigma,alpha,y,prob,risk,weight_old);
results = table(baseline.K,baseline.r,baseline.w,baseline.c1, ...
    baseline.c2_l,baseline.c2_h, ...
    'VariableNames',{'K','r','w','c1','c2_l','c2_h'});
disp('Baseline competitive equilibrium')
disp(results)
fprintf('Iterations: %d; market-clearing error: %.3e\n', ...
    baseline.iterations,baseline.error);

%% 3. A second risk level, keeping mean labour unchanged
low_risk = 0.05;
lower_risk = solve_equilibrium(beta,sigma,alpha,y,prob,low_risk,weight_old);
risk_values = [low_risk,risk];

%% 4. Capital supply and demand (adapted from the Konstanz teaching code)
% At each trial rental rate, obtain capital demand and its implied wage.
% Households take this pair of prices as given when choosing saving.
L = 1;                      % Both risk scenarios have mean labour equal to 1
r_grid = linspace(0.65*min(baseline.r,lower_risk.r), ...
    1.35*max(baseline.r,lower_risk.r),150)';
K_demand = L*(alpha./r_grid).^(1/(1-alpha));
w_grid = (1-alpha)*(K_demand/L).^alpha;
K_supply = zeros(length(r_grid),2);

for j = 1:2
    e_l = 1-risk_values(j)/prob;
    e_h = 1+risk_values(j)/(1-prob);
    for i = 1:length(r_grid)
        K_supply(i,j) = solve_household(r_grid(i),w_grid(i), ...
            sigma,prob,beta,y,e_l,e_h);
    end
end

fig_baseline = figure('Color','white','Name','Baseline capital market');
plot(K_supply(:,2),r_grid,'b-','LineWidth',2);
hold on
plot(K_demand,r_grid,'r-','LineWidth',2);
plot(baseline.K,baseline.r,'ko','MarkerFaceColor','k','MarkerSize',7);
xlabel('Capital K');
ylabel('Rental rate r');
title('Baseline capital supply and demand');
legend('Capital supply','Capital demand','Equilibrium','Location','northeast');
xlim([0,max([K_demand;K_supply(:)])*1.05]);
ylim([min(r_grid),max(r_grid)]);
grid on
set(gca,'FontSize',12);

fig_risk = figure('Color','white','Name','Income risk and equilibrium');
plot(K_supply(:,1),r_grid,'b-','LineWidth',2);
hold on
plot(K_supply(:,2),r_grid,'b--','LineWidth',2);
plot(K_demand,r_grid,'r-','LineWidth',2);
plot(lower_risk.K,lower_risk.r,'ko','MarkerFaceColor','white','MarkerSize',7);
plot(baseline.K,baseline.r,'ko','MarkerFaceColor','k','MarkerSize',7);
xlabel('Capital K');
ylabel('Rental rate r');
title('More income risk, unchanged mean labour');
legend(sprintf('Supply: risk = %.2f',low_risk), ...
    sprintf('Supply: risk = %.2f',risk),'Capital demand', ...
    sprintf('Lower risk (\\epsilon = %.2f)',low_risk), ...
    sprintf('Higher risk (\\epsilon = %.2f)',risk),'Location','northeast');
% Zoom around the two equilibria so the small risk effect is visible.
xlim([0.90*min(baseline.K,lower_risk.K),1.10*max(baseline.K,lower_risk.K)]);
ylim([0.95*min(baseline.r,lower_risk.r),1.05*max(baseline.r,lower_risk.r)]);
grid on
set(gca,'FontSize',12);

if export_figures
    % Files go beside this script. Lecture copies are kept locally in Dropbox.
    output_folder = fileparts(mfilename('fullpath')); %#ok<UNRCH> Enabled by the export switch above.
    exportgraphics(fig_baseline,fullfile(output_folder, ...
        'workshop_capital_market.pdf'),'ContentType','vector');
    exportgraphics(fig_risk,fullfile(output_folder, ...
        'workshop_income_risk.pdf'),'ContentType','vector');
end

%% Local helper functions
function eq = solve_equilibrium(beta,sigma,alpha,y,prob,risk,weight_old)
% SOLVE_EQUILIBRIUM Find capital using damped fixed-point iteration.
%
% INPUTS:
% beta, sigma: Scalar discount factor and CRRA coefficient.
% alpha, y: Scalar capital share and initial endowment.
% prob, risk: Scalar low-state probability and productivity dispersion.
% weight_old: Scalar weight on the old capital guess, between 0 and 1.
%
% OUTPUTS:
% eq: Scalar structure containing equilibrium prices, quantities and diagnostics.
if beta <= 0 || sigma <= 0 || alpha <= 0 || alpha >= 1 || y <= 0 ...
        || prob <= 0 || prob >= 1 || risk < 0 || risk >= prob ...
        || weight_old <= 0 || weight_old >= 1
    error('Use positive preferences/endowment, valid shares, and 0 <= risk < prob.');
end
e_l = 1-risk/prob;
e_h = 1+risk/(1-prob);
L = prob*e_l+(1-prob)*e_h;
tolerance = 1e-8;
max_iterations = 10000;

% Step 1: Guess aggregate capital.
K = 0.5*y;
for iteration = 1:max_iterations
    % Step 2: Compute factor prices from firms' marginal products.
    r = alpha*(K/L)^(alpha-1);
    w = (1-alpha)*(K/L)^alpha;

    % Step 3: Choose individual saving, holding r and w fixed.
    k = solve_household(r,w,sigma,prob,beta,y,e_l,e_h);

    % Step 4: Check market clearing BEFORE changing the capital guess.
    market_error = k-K;
    if abs(market_error) < tolerance
        break
    end

    % Step 5: Move part of the way towards households' desired saving.
    K = weight_old*K+(1-weight_old)*k;
end
if abs(market_error) >= tolerance
    error('Capital iteration did not converge. Check the parameters and damping.');
end

% Recover equilibrium quantities using the final aggregate capital.
r = alpha*(K/L)^(alpha-1);
w = (1-alpha)*(K/L)^alpha;
eq.K = K;
eq.k = k;                   % Retained to inspect the market-clearing error
eq.r = r;
eq.w = w;
eq.c1 = y-K;
eq.c2_l = r*K+w*e_l;
eq.c2_h = r*K+w*e_h;
eq.L = L;
eq.e_l = e_l;
eq.e_h = e_h;
eq.iterations = iteration;
eq.error = market_error;
eq.euler_residual = eq.c1^(-sigma) ...
    - beta*r*(prob*eq.c2_l^(-sigma)+(1-prob)*eq.c2_h^(-sigma));
end %end function

function k = solve_household(r,w,sigma,prob,beta,y,e_l,e_h)
% SOLVE_HOUSEHOLD Choose saving at given factor prices.
%
% INPUTS:
% r, w: Scalar capital rental rate and wage per efficiency unit.
% sigma, prob, beta: Scalar CRRA coefficient, low-state probability and discount factor.
% y, e_l, e_h: Scalar initial endowment and low/high labour productivity.
%
% OUTPUTS:
% k: Scalar optimal saving, constrained to be non-negative and below y.
options = optimset('TolX',1e-10,'Display','off');
[k,~,exitflag] = fminbnd(@(k) f_household(k,r,w,sigma,prob,beta,y,e_l,e_h), ...
    0,y,options);
if exitflag <= 0
    error('The household maximization did not converge.');
end
end %end function

function F = f_household(k,r,w,sigma,prob,beta,y,e_l,e_h)
% F_HOUSEHOLD Return negative expected lifetime utility.
%
% INPUTS:
% k, r, w: Scalar individual saving and fixed factor prices.
% sigma, prob, beta: Scalar CRRA coefficient, low-state probability and discount factor.
% y, e_l, e_h: Scalar initial endowment and low/high labour productivity.
%
% OUTPUTS:
% F: Scalar negative expected lifetime utility, minimized by fminbnd.
c1 = y-k;
c2_l = r*k+w*e_l;
c2_h = r*k+w*e_h;
F = -(f_util(c1,sigma)+beta*(prob*f_util(c2_l,sigma) ...
    +(1-prob)*f_util(c2_h,sigma)));
end %end function

function utility = f_util(c,sigma)
% F_UTIL Evaluate CRRA utility, including the log-utility case.
%
% INPUTS:
% c: Positive scalar consumption.
% sigma: Positive scalar CRRA coefficient.
%
% OUTPUTS:
% utility: Scalar period utility.
if sigma == 1
    utility = log(c);
else
    utility = c^(1-sigma)/(1-sigma);
end
end %end function

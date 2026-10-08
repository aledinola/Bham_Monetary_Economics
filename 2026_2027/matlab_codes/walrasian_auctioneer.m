%% Competitive equilibrium in the Robinson Crusoe economy
% We show how to compute the equilibrium wage that equates labor demand to
% labor supply.
% --------------- STEPS OF THE ALGORITHM ---------------------------------%
% (1) Walrasian auctioneer announces a wage w0
% (2) Given w0, firm tells the auctioneer what is her desired labor demand
% (3) Given w0, household tells the auctioneer what is his desired labor
%     supply
% (4) If |labor_demand - labor_supply|<tol, the auctioneer is happy and
%     accepts w0 as equilibrium wage. If not, he announces a new w1 and
%     process goes back to step 2.
% ------------------------------------------------------------------------%
% Question: Suppose we found that the competitive equilibrium wage is w_ce
% and consumption and labor are c_ce and n_ce. How do we know we found the
% correct values?

clear,clc,close all

%% Set parameters
% Production function: y = A*n^alpha
% Utility of household: log(c)-theta*n^(1+1/vareps)/(1+1/vareps)

A      = 1;    % Total factor productivity
alpha  = 0.6;  % Coefficient on Cobb-Douglas
theta  = 0.5;  % Weight on labor disutility
vareps = 1.0;  % Curvature of disutility of labor
lambda = 0.1;  % Speed of wage adjustment
max_iter = 50;

w0 = 1.0;

% Store the path of wages and relative excess demand
wagePath = zeros(max_iter,1);
relativeExcessDemandPath = zeros(max_iter,1);

for ii=1:max_iter

    % Store current wage
    wagePath(ii) = w0;

    % Compute labor demand from the firm's profit-maximization condition
    laborDemand = ((alpha*A)/w0)^(1/(1-alpha));

    % Optimal profits
    profits = A*laborDemand^alpha - w0*laborDemand;

    % Compute labor supply from household's utility maximization
    % Household labor supply satisfies theta*n^(1/vareps) = w/c,
    % with c = w*n + profits
    foc = @(h) w0./(w0*h+profits)-theta*h.^(1/vareps);
    laborSupply = fzero(foc,[0,5]);

    % Let ED(w) = laborDemand - laborSupply
    % ED(w)>0: excess demand for labor ==> raise the wage.
    % ED(w)<0: excess supply for labor ==> lower the wage.
    % ED(w) close to 0: stop.

    excessDemand = laborDemand - laborSupply;
    relativeExcessDemand = excessDemand/(laborDemand + laborSupply);

    % Store relative excess demand
    relativeExcessDemandPath(ii) = relativeExcessDemand;

    % Update wage
    w1 = w0 * (1 + lambda*relativeExcessDemand);

    fprintf('Relative excess demand: %f \n',relativeExcessDemand)

    w0 = w1;

end

%% Plot convergence of the Walrasian auctioneer

figure

subplot(2,1,1)
plot(1:max_iter,wagePath,'LineWidth',1.5)
xlabel('Auctioneer iteration')
ylabel('Wage')
title('Wage adjustment')

subplot(2,1,2)
plot(1:max_iter,relativeExcessDemandPath,'LineWidth',1.5)
yline(0,'--')
xlabel('Auctioneer iteration')
ylabel('Relative excess demand')
title('Excess demand for labor')

%% Compute competitive equilibrium allocation

w_ce = w0;
n_ce = ((alpha*A)/w_ce)^(1/(1-alpha));
c_ce = A*n_ce^alpha;

fprintf(' \n')
fprintf('Equilibrium wage: %f\n',w_ce)
fprintf('Equilibrium consumption: %f\n',c_ce)
fprintf('Equilibrium labor: %f\n',n_ce)

%% Compare with social planner solution

n_sp = (alpha/theta)^(vareps/(1+vareps));
c_sp = A*n_sp^alpha;

fprintf('Social planner consumption: %f\n',c_sp)
fprintf('Social planner labor: %f\n',n_sp)
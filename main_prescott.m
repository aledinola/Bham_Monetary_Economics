%% Exercise: Prescott calculation in Kurlat's textbook

clear
clc
close all

disp('--------------------------------------------------')
disp('        PRESCOTT CALCULATION')
disp('--------------------------------------------------')

%% Parameters

alpha = 1.54;
w     = 1;

% US
tau_us = 0.34;
T_us   = 0.102;

% Europe
tau_eu = 0.53;
T_eu   = 0.124;


%% Solve for allocations

US = solve_country(tau_us,T_us,alpha,w);
EU = solve_country(tau_eu,T_eu,alpha,w);


%% Government budget constraint

fprintf('\nGOVERNMENT BUDGET CONSTRAINT\n')
fprintf('--------------------------------------------------\n')
fprintf('US deficit:      %12.8f\n',US.deficit)
fprintf('Europe deficit:  %12.8f\n',EU.deficit)


%% Allocations

fprintf('\nALLOCATIONS\n')
fprintf('--------------------------------------------------\n')
fprintf('%-15s %12s %12s\n','','US','Europe')
fprintf('%-15s %12.6f %12.6f\n','Labor',       US.labor,       EU.labor)
fprintf('%-15s %12.6f %12.6f\n','Leisure',      US.leisure,      EU.leisure)
fprintf('%-15s %12.6f %12.6f\n','Output',       US.output,       EU.output)
fprintf('%-15s %12.6f %12.6f\n','Consumption',  US.consumption,  EU.consumption)
fprintf('%-15s %12.6f %12.6f\n','Utility',      US.utility,       EU.utility)


%% Output difference between Europe and US

output_gap = 100*(US.output - EU.output)/US.output;

fprintf('\nOUTPUT COMPARISON\n')
fprintf('--------------------------------------------------\n')
fprintf('European output is %.2f%% lower than US output.\n',output_gap)


%% Consumption-equivalent welfare: lambda

% u_EU = u(lambda*c_US,l_US)
%
% With log utility:
% log(lambda) = u_EU - u_US

log_lambda = EU.utility - US.utility;
lambda     = exp(log_lambda);

fprintf('\nWELFARE COMPARISON\n')
fprintf('--------------------------------------------------\n')
fprintf('log(lambda): %12.6f\n',log_lambda)
fprintf('lambda:      %12.6f\n',lambda)
fprintf('Consumption-equivalent welfare gap: %.2f%%\n', ...
        100*(lambda-1))


%% Frisch elasticity

% Holding consumption fixed:
%
% epsilon = l/(1-l) = leisure/labor

fprintf('\nFRISCH ELASTICITY\n')
fprintf('--------------------------------------------------\n')
fprintf('US:      %12.6f\n',US.frisch)
fprintf('Europe:  %12.6f\n',EU.frisch)


%% ------------------------ SUBFUNCTIONS ------------------------------- %%

function S = solve_country(tau,T,alpha,w)
% Solve household allocation and related statistics.
%
% INPUTS:
%   tau   tax rate
%   T     lump-sum transfer
%   alpha preference parameter
%   w     wage
%
% OUTPUT:
%   S     structure containing equilibrium quantities

    % Optimal labor supply
    labor_interior = (1/(1+alpha)) * (1 - alpha*T/(w*(1-tau)));

    S.labor = max(0,labor_interior);

    % Leisure
    S.leisure = 1 - S.labor;

    % Production function: Y = L
    S.output = S.labor;

    % With government budget balance and w = 1:
    % aggregate resource constraint implies c = Y.
    S.consumption = S.output;

    % Utility
    S.utility = log(S.consumption) + alpha*log(S.leisure);

    % Government deficit:
    % transfers minus labor-income tax revenue
    S.deficit = T - tau*w*S.labor;

    % Frisch elasticity of labor supply
    % with respect to the after-tax wage,
    % holding consumption fixed
    S.frisch = S.leisure/S.labor;

end
clear,clc,close all
% Labor endowment: e_l with prob, e_h with 1-prob
% 0<e_l<e_h and 0<prob<1.

disp('Two-period model based on Davila et al.')

% Set parameters
beta  = 0.95^20;
sigma = 2;
alpha = 0.36;
y     = 1;
prob  = 0.5;
risk  = 0.1;
e_l   = 1-risk/prob;
e_h   = 1+risk/(1-prob); 
% Average labor efficiency is always 1:
L     = prob*e_l+(1-prob)*e_h;
weight_old = 0.9;

% Solve for competitive equilibrium

% Step 1: Guess capital
K_guess = 0.5;
err = inf;

while err>1e-10
    % Step 2: compute r and w from factor pricing conditions
    r = f_mpk(K_guess,L,alpha);
    w = f_mpl(K_guess,L,alpha);

    % Step 3: Solve household problem for given (r,w)
    savings = fminbnd(@(a) f_household(a,r,w,sigma,prob,beta,y,e_l,e_h),eps,y-eps);

    % Step 4: Update capital guess based on savings
    K_new = weight_old*K_guess + (1-weight_old)*savings; 
    err = abs(savings - K_guess); 
    K_guess = K_new;
    disp([K_guess,savings])
end

% Step 5: Store the final capital and savings values for analysis
K_final = K_guess;
savings_final = savings;
r = f_mpk(K_final,L,alpha);
w = f_mpl(K_final,L,alpha);

% Display final results
disp(['Final Capital: ', num2str(K_final), ', Final Savings: ', num2str(savings_final)]);
% Add interest rate
interestRate = r; % Store the interest rate 
disp(['Interest Rate: ', num2str(interestRate)]);

% Alternative method
K_final2 = fzero(@(K) f_euler(K,L,sigma,prob,beta,y,e_l,e_h,alpha),[eps,y-eps]); 

% ---------------------- SUBFUNCTIONS ------------------------------------%

function mpk = f_mpk(K,L,alpha)
    mpk = alpha*(K/L)^(alpha-1);
end

function mpl = f_mpl(K,L,alpha)
    mpl = (1-alpha)*(K/L)^alpha;
end

function util = f_util(c,sigma)
    if sigma==1
        util=log(c);
    else
        util = c^(1-sigma)/(1-sigma);
    end
end %end function "f_util"


function F = f_household(a,r,w,sigma,prob,beta,y,e_l,e_h)
% Objective function of households problem.
% Partial equilibrium: household chooses savings taking
% prices r and w as given.

util1 = f_util(y-a,sigma);
c2_l = r*a+w*e_l;
c2_h = r*a+w*e_h;
util2 = prob*f_util(c2_l,sigma)+(1-prob)*f_util(c2_h,sigma);
lifetime_util = util1+beta*util2;

F = -lifetime_util;

end %end function "f_household"

function F = f_euler(K,L,sigma,prob,beta,y,e_l,e_h,alpha)
% Euler equation in competitive equilibrium

r    = f_mpk(K,L,alpha);
w    = f_mpl(K,L,alpha); 
c1   = y-K;
c2_l = r*K+w*e_l;
c2_h = r*K+w*e_h;
LHS  = c1^(-sigma);
RHS  = beta*r*(prob*c2_l^(-sigma)+(1-prob)*c2_h^(-sigma));

F    = LHS-RHS;

end %end function "f_euler"


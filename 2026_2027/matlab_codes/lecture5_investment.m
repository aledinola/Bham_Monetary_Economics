%[text] # Lecture 5: Investment and Capital Accumulation in MATLAB
%[text] **Companion to Lecture 5, 2026/2027.** This live script uses the two-period models from the lecture to study investment, capital demand, general equilibrium, productivity shocks, and the role of the intertemporal elasticity of substitution (IES).
%[text] Open this plain-text `.m` file in MATLAB's **Live Editor** and run the sections in order. It uses only base MATLAB.
%[text] The emphasis is on economic interpretation. Before running each comparative-static section, write down your prediction.
%
%[text] ## Learning goals
%[text] By the end of this exercise you should be able to:
%[text] - compute optimal investment in partial equilibrium;
%[text] - plot the capital-demand curve;
%[text] - compute the competitive-equilibrium allocation of the two-period economy;
%[text] - study productivity shocks numerically;
%[text] - understand why the response of investment to future productivity depends on the IES;
%[text] - solve the equilibrium numerically with `fzero`, without using the closed-form solution.

clear
clc
close all

%%
%[text] # 1. Investment in partial equilibrium
%[text] A representative firm produces with capital:
%[text] $Y_t=A_tF(K_t),\qquad F(K)=K^\alpha,\qquad 0<\alpha<1.$
%[text] Period-1 capital $K_1$ is predetermined. Capital evolves according to
%[text] $K_2=I_1+(1-d)K_1.$
%[text] The firm chooses $K_2$ to maximize the present discounted value of profits. The optimality condition is
%[text] $A_2F'(K_2)=r_1+d.$
%[text] With $F(K)=K^\alpha$,
%[text] $\alpha A_2K_2^{\alpha-1}=r_1+d,$
%[text] so optimal capital is
%[text] $K_2^\*=\left(\frac{\alpha A_2}{r_1+d}\right)^{1/(1-\alpha)}.$
%[text] Investment is then
%[text] $I_1^\*=K_2^\*-(1-d)K_1.$

% Parameters
alpha = 0.35;
A2 = 1.00;
r1 = 0.04;
d = 0.10;
K1 = 5;

% Optimal capital and investment
K2_star = (alpha * A2 / (r1 + d))^(1 / (1 - alpha));
I1_star = K2_star - (1 - d) * K1;

fprintf('PARTIAL EQUILIBRIUM\n')
fprintf('Optimal K2 = %.4f\n', K2_star)
fprintf('Optimal I1 = %.4f\n\n', I1_star)

%[text] **Question 1.** What happens to optimal capital and investment if the interest rate rises? What happens if future productivity $A_2$ rises? Explain using the marginal benefit and marginal cost of capital.

%%
%[text] ## 1.1 Plot the capital-demand curve
%[text] Rearranging the firm's optimality condition gives the capital-demand curve in $(K_2,r_1)$ space:
%[text] $r_1(K_2)=\alpha A_2K_2^{\alpha-1}-d.$
%[text] Because the marginal product of capital is diminishing, the curve slopes downward.

K2_grid = linspace(0.2, 12, 300);
r_demand = alpha * A2 .* K2_grid.^(alpha - 1) - d;

figure('Color', 'w')
plot(K2_grid, r_demand, 'LineWidth', 2)
yline(0, ':')
xlabel('Capital next period, K_2')
ylabel('Real interest rate, r_1')
title('Capital demand')
grid on

%[text] **Question 2.** Why does the capital-demand curve slope downward?
%[text] **Try it.** Change `A2` above from 1 to 1.2 and rerun this section. Does the curve shift in the direction you predicted?

%%
%[text] ## 1.2 Capital demand at different productivity levels
%[text] The next figure compares the demand curve for three values of future productivity.

A2_values = [0.8, 1.0, 1.2];

figure('Color', 'w')
hold on

for j = 1:length(A2_values)
    A2_j = A2_values(j);
    r_j = alpha * A2_j .* K2_grid.^(alpha - 1) - d;
    plot(K2_grid, r_j, 'LineWidth', 2, ...
        'DisplayName', sprintf('A_2 = %.1f', A2_j))
end

hold off
xlabel('Capital next period, K_2')
ylabel('Real interest rate, r_1')
title('Future productivity and capital demand')
legend('Location', 'best')
grid on

%[text] **Question 3.** Give an economic interpretation of the shift in capital demand when $A_2$ changes.

%%
%[text] # 2. Dynamic general equilibrium with capital accumulation
%[text] We now use the general-equilibrium model from Lecture 5. Production is linear:
%[text] $Y_t=A_tK_t.$
%[text] Depreciation is complete, so
%[text] $K_2=I_1.$
%[text] Preferences are CRRA:
%[text] $U(C_1)+\beta U(C_2),\qquad U(C)=\frac{C^{1-\sigma}-1}{1-\sigma}.$
%[text] The competitive equilibrium satisfies
%[text] $\frac{C_2}{C_1}=[\beta(1+r_1)]^{1/\sigma},$
%[text] $C_1+I_1=A_1K_1,$
%[text] $C_2=A_2K_2,$
%[text] $K_2=I_1,$
%[text] $1+r_1=A_2.$
%[text] The lecture derives the endogenous saving rate
%[text] $s(A_2)=\frac{1}{1+\left(\frac{1}{\beta A_2}\right)^{1/\sigma}A_2},$
%[text] and therefore
%[text] $I_1=s(A_2)Y_1,\qquad C_1=[1-s(A_2)]Y_1.$

% Baseline parameters
A1 = 1.00;
A2 = 1.05;
K1 = 1.00;
beta = 0.96;
sigma = 2.00;

% Current output
Y1 = A1 * K1;

% Endogenous saving rate
s = 1 / (1 + (1 / (beta * A2))^(1 / sigma) * A2);

% Equilibrium allocation
I1 = s * Y1;
K2 = I1;
C1 = (1 - s) * Y1;
Y2 = A2 * K2;
C2 = Y2;
r1 = A2 - 1;

equilibrium = table(C1, C2, I1, K2, Y1, Y2, r1, s, ...
    'VariableNames', {'C1','C2','I1','K2','Y1','Y2','r1','SavingRate'});
disp(equilibrium)

% Check the equilibrium conditions numerically
goods1_residual = C1 + I1 - Y1;
goods2_residual = C2 - Y2;
euler_residual = C2 / C1 - (beta * (1 + r1))^(1 / sigma);

fprintf('Equilibrium checks\n')
fprintf('Period-1 goods market residual = %.2e\n', goods1_residual)
fprintf('Period-2 goods market residual = %.2e\n', goods2_residual)
fprintf('Euler equation residual         = %.2e\n\n', euler_residual)

%[text] **Question 4.** Which equilibrium variable is pinned down directly by the firm's optimality condition? Which variables are then pinned down by household optimality and market clearing?

%%
%[text] # 3. A current productivity shock: changing A_1
%[text] We first vary current productivity $A_1$, keeping $A_2$, $\beta$, $\sigma$, and $K_1$ fixed.
%[text] **Before running the code:** predict what happens to $Y_1$, $C_1$, $I_1$, and $Y_2$ when $A_1$ rises.

A1_grid = linspace(0.7, 1.3, 100);

% The saving rate does not depend on A1
s_A1 = 1 / (1 + (1 / (beta * A2))^(1 / sigma) * A2);

Y1_A1 = A1_grid * K1;
I1_A1 = s_A1 * Y1_A1;
C1_A1 = (1 - s_A1) * Y1_A1;
Y2_A1 = A2 * I1_A1;

figure('Color', 'w')
plot(A1_grid, Y1_A1, 'LineWidth', 2)
hold on
plot(A1_grid, C1_A1, 'LineWidth', 2)
plot(A1_grid, I1_A1, 'LineWidth', 2)
plot(A1_grid, Y2_A1, 'LineWidth', 2)
hold off
xlabel('Current productivity, A_1')
ylabel('Equilibrium quantity')
title('Current productivity shock')
legend('Y_1', 'C_1', 'I_1', 'Y_2', 'Location', 'best')
grid on

%[text] **Question 5.** Are the responses proportional to $A_1$? Why does the saving rate remain unchanged?
%[text] **Economic interpretation:** a change in $A_1$ changes the total resources available today. The economy allocates those resources between current consumption and investment using the same saving rate.

%%
%[text] # 4. Future productivity and the IES
%[text] This is the central comparative-static exercise.
%[text] The intertemporal elasticity of substitution is
%[text] $\mathrm{IES}=1/\sigma.$
%[text] We vary future productivity $A_2$ and compare three values of $\sigma$:
%[text] - $\sigma=0.5$ gives IES $=2$;
%[text] - $\sigma=1$ gives log utility and IES $=1$;
%[text] - $\sigma=2$ gives IES $=0.5$.
%[text] **Before running the code:** for each value of $\sigma$, predict whether investment rises or falls when $A_2$ rises.

A2_grid = linspace(0.7, 1.3, 150);
sigma_values = [0.5, 1, 2];

Y1 = A1 * K1;

figure('Color', 'w')
hold on

for j = 1:length(sigma_values)
    sigma_j = sigma_values(j);

    s_grid = 1 ./ ...
        (1 + (1 ./ (beta .* A2_grid)).^(1 / sigma_j) .* A2_grid);

    I1_grid = s_grid * Y1;

    plot(A2_grid, I1_grid, 'LineWidth', 2, ...
        'DisplayName', sprintf('\\sigma = %.1f, IES = %.1f', ...
        sigma_j, 1 / sigma_j))
end

hold off
xlabel('Future productivity, A_2')
ylabel('Investment, I_1')
title('Future productivity, investment, and the IES')
legend('Location', 'best')
grid on

%[text] **Question 6.** Describe the three curves.
%[text] 1. What happens when $\sigma<1$?
%[text] 2. What happens when $\sigma=1$?
%[text] 3. What happens when $\sigma>1$?
%[text] **Question 7.** For the Lecture 5 case $\sigma>1$, explain why lower future productivity can lead to *higher* investment today even though the return on investment has fallen. Your explanation should use consumption smoothing.

%%
%[text] ## 4.1 The saving rate itself
%[text] The same mechanism can be seen directly by plotting $s(A_2)$.

figure('Color', 'w')
hold on

for j = 1:length(sigma_values)
    sigma_j = sigma_values(j);

    s_grid = 1 ./ ...
        (1 + (1 ./ (beta .* A2_grid)).^(1 / sigma_j) .* A2_grid);

    plot(A2_grid, s_grid, 'LineWidth', 2, ...
        'DisplayName', sprintf('\\sigma = %.1f', sigma_j))
end

hold off
xlabel('Future productivity, A_2')
ylabel('Saving rate, s(A_2)')
title('The endogenous saving rate')
legend('Location', 'best')
grid on

%[text] **Question 8.** In the Solow model the saving rate is exogenous. Here it is endogenous. Which preference and technology parameters determine it?

%%
%[text] # 5. Solve the equilibrium numerically with fzero
%[text] In simple models we often have a closed-form solution. In larger macroeconomic models we usually do not.
%[text] We now solve exactly the same equilibrium numerically.
%[text] Use
%[text] $C_1=Y_1-I_1,\qquad C_2=A_2I_1,\qquad 1+r_1=A_2.$
%[text] Substitute these expressions into the Euler equation:
%[text] $\frac{A_2I_1}{Y_1-I_1}=(\beta A_2)^{1/\sigma}.$
%[text] Define the difference between the two sides as a function of $I_1$ and find the value that makes the difference equal to zero.

% Restore the baseline parameters
A1 = 1.00;
A2 = 1.05;
K1 = 1.00;
beta = 0.96;
sigma = 2.00;

Y1 = A1 * K1;

% Equation whose root is equilibrium investment
investment_residual = @(I) ...
    A2 .* I ./ (Y1 - I) - (beta * A2)^(1 / sigma);

% Consumption must be positive, so equilibrium investment lies between 0 and Y1
I_lo = 1e-8;
I_hi = Y1 - 1e-8;

I1_numerical = fzero(investment_residual, [I_lo, I_hi]);

% Recover the remaining equilibrium quantities
K2_numerical = I1_numerical;
C1_numerical = Y1 - I1_numerical;
Y2_numerical = A2 * K2_numerical;
C2_numerical = Y2_numerical;
r1_numerical = A2 - 1;

% Closed-form investment for comparison
s_closed = 1 / (1 + (1 / (beta * A2))^(1 / sigma) * A2);
I1_closed = s_closed * Y1;

fprintf('NUMERICAL EQUILIBRIUM\n')
fprintf('I1 from fzero       = %.10f\n', I1_numerical)
fprintf('I1 from closed form = %.10f\n', I1_closed)
fprintf('Difference          = %.2e\n', I1_numerical - I1_closed)
fprintf('Euler residual      = %.2e\n\n', investment_residual(I1_numerical))

%[text] **Question 9.** Why is the interval $(0,Y_1)$ a natural search interval for `fzero`?
%[text] **Question 10.** Why is this numerical method useful even though this particular model has a closed-form solution?

%%
%[text] # 6. Optional challenge: diminishing returns to capital
%[text] Replace the linear technology by
%[text] $Y_t=A_tK_t^\alpha,\qquad 0<\alpha<1,$
%[text] while keeping full depreciation. The planner (and competitive equilibrium allocation) satisfies
%[text] $C_1+K_2=A_1K_1^\alpha,$
%[text] $C_2=A_2K_2^\alpha,$
%[text] and the Euler equation
%[text] $U'(C_1)=\beta A_2\alpha K_2^{\alpha-1}U'(C_2).$
%[text] There is no need to derive a closed-form solution. Solve for $K_2$ using `fzero`.

alpha = 0.35;
A1 = 1.00;
A2 = 1.05;
K1 = 1.00;
beta = 0.96;
sigma = 2.00;

Y1 = A1 * K1^alpha;

euler_K2 = @(K2) ...
    (Y1 - K2).^(-sigma) ...
    - beta * A2 * alpha .* K2.^(alpha - 1) ...
    .* (A2 .* K2.^alpha).^(-sigma);

K2_lo = 1e-6;
K2_hi = Y1 - 1e-6;

K2_diminishing = fzero(euler_K2, [K2_lo, K2_hi]);

C1_diminishing = Y1 - K2_diminishing;
C2_diminishing = A2 * K2_diminishing^alpha;

fprintf('OPTIONAL DIMINISHING-RETURNS MODEL\n')
fprintf('K2 = %.6f\n', K2_diminishing)
fprintf('C1 = %.6f\n', C1_diminishing)
fprintf('C2 = %.6f\n', C2_diminishing)
fprintf('Euler residual = %.2e\n', euler_K2(K2_diminishing))

%[text] **Challenge question.** Repeat the future-productivity experiment from Section 4 in this diminishing-returns economy. Does the role of the IES remain visible?
%
%[text] # Takeaway
%[text] MATLAB lets us move from a model's equilibrium conditions to quantitative comparative statics. In this lecture the closed-form solution is useful because it makes the economics transparent. The `fzero` exercise shows the method we will need when closed-form solutions are no longer available.

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline","rightPanelPercent":35}
%---

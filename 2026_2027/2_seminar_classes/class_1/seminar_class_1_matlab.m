%[text] # Class 1: solving the labor supply model in MATLAB
%[text] **Companion to Exercise 1, 2026/2027.** We find optimal hours numerically and recreate the marginal-benefit/marginal-cost diagram in the [seminar solutions](seminar_class_1.pdf). Open this plain-text live script in MATLAB's Live Editor and click **Run**. It uses only base MATLAB and needs no supporting files. Run the sections in order.
%[text] We follow the solutions and write household hours as $h$. In Exercise 2, $n$ denotes hours hired by the firm. Here the wage and profit income are given to the household: we are solving a **partial-equilibrium** problem.

%%
%[text] ## 1. The model and a numerical example
%[text] The household chooses hours between zero and one. It receives wage income and nonlabor income (for example, profits), and spends its income on consumption:
%[text] $c=wh+\\Pi,\\qquad U(c,h)=\\log c-\\theta\\frac{h^{1+1/\\varepsilon}}{1+1/\\varepsilon}.$
%[text] Substituting the budget constraint into utility and differentiating with respect to hours gives:
%[text] $\\underbrace{\\frac{w}{wh+\\Pi}}\_{\\text{marginal benefit (LHS)}}=\\underbrace{\\theta h^{1/\\varepsilon}}\_{\\text{marginal cost (RHS)}}.$
%[text] The equation defines optimal hours implicitly. For arbitrary positive profit income and elasticity, we cannot generally isolate hours in an elementary closed-form expression. Some special cases can be solved explicitly; we return to zero profit income below.
%[text] Choose the following illustrative values. As in the exercise, theta exceeds one. Keep profit income positive in sections 1--3 so the LHS is defined even at zero hours. The MATLAB name `Pi` means profit income; lowercase `pi` is MATLAB's circle constant.
w = 1;          % Wage
Pi = 0.4;       % Profit income, held fixed by the household
theta = 2;      % Weight on the disutility of work (greater than one)
epsilon = 0.7;  % Labor supply elasticity parameter (positive)

%%
%[text] ## 2. Find the intersection with fzero
%[text] Define the two sides as functions of hours. The expression `@(h)` creates a small function whose input is `h`. Dots in `./` and `.^` let us also evaluate the functions at a whole list of hours when drawing the plot.
LHS = @(h) w ./ (w .* h + Pi);
RHS = @(h) theta .* h.^(1 / epsilon);
%[text] Subtract the RHS from the LHS. We want the value of hours that makes this difference zero:
%[text] $F(h)=\\mathrm{LHS}(h)-\\mathrm{RHS}(h)=0.$
F = @(h) LHS(h) - RHS(h);
h_star = fzero(F, [0, 1]);
c_star = w * h_star + Pi;

fprintf('Optimal hours:       h* = %.6f\n', h_star);
fprintf('Optimal consumption: c* = %.6f\n', c_star);
fprintf('LHS minus RHS at h*:      %.2e\n', F(h_star));
%[text] **Why use the interval [0, 1]?** At zero hours, the marginal benefit is positive and the marginal cost is zero, so `F(0)` is positive. At one hour, the marginal benefit is at most one and the marginal cost equals theta, which exceeds one. Thus `F(1)` is negative. `fzero` searches between these endpoints for a sign-changing root.
%[text] The LHS decreases with hours while the RHS increases, so there is exactly one intersection. Below it, working more raises utility; above it, working more lowers utility. The root is therefore the household's optimum. A residual close to zero in the printed output tells us the two sides agree numerically.

%%
%[text] ## 3. Recreate the diagram in the solutions
%[text] `linspace(0,1,300)` creates 300 equally spaced hours values. Evaluate each side of the first-order condition on this grid and plot the two curves. The grid draws smooth curves; `fzero` has already found the optimum independently of this grid.
h_grid = linspace(0, 1, 300);

figure('Color', 'w');
plot(h_grid, LHS(h_grid), 'b-', 'LineWidth', 2);
hold on
plot(h_grid, RHS(h_grid), 'r--', 'LineWidth', 2);
plot(h_star, LHS(h_star), 'ko', 'MarkerFaceColor', 'k');
xline(h_star, 'k:', 'h*', 'HandleVisibility', 'off');
hold off
xlabel('Hours worked, h');
ylabel('Marginal benefit / marginal cost');
title('Optimal hours: marginal benefit equals marginal cost');
legend('LHS: w / (wh + Pi)', 'RHS: theta h^{1/epsilon}', ...
    'Optimum', 'Location', 'best');
xlim([0, 1]);
grid on
%[text] The blue curve starts at the wage divided by profit income; the red curve starts at zero. Their intersection is the value printed above. This is a numerical version of the schematic in part (b) of the solutions.
%[text] **Try it:** raise profit income to 0.8 in section 1 and rerun the file. Predict which curve moves and whether optimal hours rise or fall. MATLAB's small functions remember the parameter values used when they were defined, so rerun section 2 after changing a parameter.

%%
%[text] ## 4. What happens when the wage rises?
%[text] We now solve the same equation at a sequence of wages, holding profit income fixed. A `for` loop repeats the same calculation for each wage; `zeros` reserves space to store the answers.
w_grid = linspace(0.5, 2, 50);
h_supply = zeros(size(w_grid));

for k = 1:length(w_grid)
    wage = w_grid(k);
    F_wage = @(h) wage ./ (wage .* h + Pi) - RHS(h);
    h_supply(k) = fzero(F_wage, [0, 1]);
end
%[text] For comparison, part (d) sets profit income to zero. In that special case the wage cancels from the first-order condition, leaving a closed-form answer:
%[text] $\\frac{1}{h}=\\theta h^{1/\\varepsilon}\\quad\\Longrightarrow\\quad h^\*=\\theta^{-\\varepsilon/(1+\\varepsilon)},\\qquad c^\*=wh^\*.$
h_zero_profit = theta^(-epsilon / (1 + epsilon));
%[text] We can also recover this answer numerically. Multiply the zero-profit condition by hours before calling `fzero`; this avoids evaluating the undefined expression `1/0` at the lower endpoint.
F_zero_profit = @(h) theta * h.^(1 + 1 / epsilon) - 1;
h_zero_numerical = fzero(F_zero_profit, [0, 1]);
fprintf('Zero profits, closed-form hours: %.6f\n', h_zero_profit);
fprintf('Zero profits, numerical hours:   %.6f\n', h_zero_numerical);

figure('Color', 'w');
plot(w_grid, h_supply, 'b-', 'LineWidth', 2);
hold on
yline(h_zero_profit, 'r--', 'LineWidth', 2);
hold off
xlabel('Wage, w');
ylabel('Optimal hours, h*');
title('Wage response: the role of profit income');
legend('Positive profit income (held fixed)', 'Zero profit income', ...
    'Location', 'best');
grid on
%[text] **Read the figure.** With positive profit income, optimal hours rise with the wage. Some consumption is financed by income that does not rise with the wage, so the income effect only partly offsets the stronger incentive to work. With zero profit income and log consumption utility, income and substitution effects exactly offset for hours. Consumption still rises with the wage.
%[text] **A distinction for Exercise 2.** Here wages and profits are exogenous. In the Robinson Crusoe equilibrium they are determined jointly with hours, and equilibrium hours do have a closed form. Do not substitute a profit function of the household's own hours into the household problem: the competitive household takes its profit income as given.

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline","rightPanelPercent":35}
%---

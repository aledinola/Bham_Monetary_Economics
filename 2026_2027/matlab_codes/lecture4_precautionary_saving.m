%[text] # Lecture 4: Precautionary saving in a two-period model
%[text] We extend the simple two-period consumption-saving model by introducing risky income in period 2.
%[text]
%[text] Period-1 income is
%[text] $$y_1=1.$$
%[text]
%[text] Period-2 income is
%[text] $$y_2(s)=
%[text] \begin{cases}
%[text] 1-\varepsilon, & s=L,\\
%[text] 1+\varepsilon, & s=H,
%[text] \end{cases}
%[text] \qquad
%[text] \Pr(L)=\Pr(H)=\frac{1}{2}.$$
%[text]
%[text] The household chooses saving $a$ before the state $s$ is known. Consumption is
%[text] $$c_1=y_1-a,$$
%[text] $$c_2(L)=1-\varepsilon+(1+r)a,$$
%[text] $$c_2(H)=1+\varepsilon+(1+r)a.$$
%[text]
%[text] With log utility, the household solves
%[text] $$\max_a \left\{
%[text] \log(y_1-a)
%[text] +\frac{\beta}{2}\log\left[1-\varepsilon+(1+r)a\right]
%[text] +\frac{\beta}{2}\log\left[1+\varepsilon+(1+r)a\right]
%[text] \right\}.$$
%[text]
%[text] The natural borrowing limit is
%[text] $$a>-\frac{1-\varepsilon}{1+r},$$
%[text] because consumption in the low-income state must be positive. Also,
%[text] $$a<y_1,$$
%[text] because first-period consumption must be positive.
%[text]
%[text] These are feasibility bounds, not additional restrictions on household behavior.

%% Parameters

y1 = 1;
r = 0.04;
beta = 1 / (1 + r);   % so beta*(1+r)=1

eps = 0.20;

% A tiny buffer keeps consumption strictly positive at the numerical bounds.
buffer = 1e-10;

%% Example 1: solve the household problem for a given epsilon
%[text] MATLAB's `fminbnd` minimizes a function, so the helper function returns
%[text] minus household utility.

a_min = -(1 - eps) / (1 + r) + buffer;
a_max = y1 - buffer;

objective = @(a) hh_objective_precautionary(a, beta, r, y1, eps);

[a_star, minus_value] = fminbnd(objective, a_min, a_max);

c1_star  = y1 - a_star;
c2L_star = 1 - eps + (1 + r) * a_star;
c2H_star = 1 + eps + (1 + r) * a_star;

fprintf('epsilon = %.2f\n', eps)
fprintf('optimal saving a* = %.5f\n', a_star)
fprintf('c1 = %.5f\n', c1_star)
fprintf('c2(L) = %.5f\n', c2L_star)
fprintf('c2(H) = %.5f\n', c2H_star)

%% Example 2: precautionary saving as income risk increases
%[text] Now vary $\varepsilon$. Since income in the low state is $1-\varepsilon$,
%[text] we require $\varepsilon<1$. For every value of $\varepsilon$, solve the
%[text] household problem again.

eps_grid = linspace(0, 0.90, 60);
a_star_grid = zeros(size(eps_grid));

for i = 1:length(eps_grid)

    eps_i = eps_grid(i);

    a_min = -(1 - eps_i) / (1 + r) + buffer;
    a_max = y1 - buffer;

    objective = @(a) hh_objective_precautionary(a, beta, r, y1, eps_i);

    a_star_grid(i) = fminbnd(objective, a_min, a_max);

end

%% Plot
%[text] Greater future income risk increases precautionary saving.

figure
plot(eps_grid, a_star_grid, ...
    'LineWidth', 2.5, ...
    'Color', [0.00 0.45 0.74])

yline(0, ':', 'Color', [0.35 0.35 0.35], 'LineWidth', 1.2)

xlabel('Income risk, \epsilon')
ylabel('Optimal saving, a^*(\epsilon)')
title('Precautionary saving')
grid on
box off
set(gca, 'FontSize', 12)

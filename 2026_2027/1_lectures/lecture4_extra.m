%[text] # Two-period Huggett: saving, interest rates and AI
%[text] **Lecture 4 computational companion.** A pure-exchange economy can have a strong desire to save even when aggregate saving is zero. Here we solve for the interest rate that reconciles household choices with this restriction, then ask how expectations about AI change that rate.
%[text] Work through the explanations, predict the direction of each effect, and run the code to test your prediction. The first part develops the solution method; the second applies it to an anticipated income boom and greater individual earnings risk.
%[text] **How to use this notebook.** Open this file in MATLAB's Live Editor and click **Run**. Run the whole notebook once before changing individual code blocks. Both main sections define their own parameters. Keep `huggett_household.m` and `huggett_equilibrium.m` in the same folder. Only base MATLAB is required. This is a plain-text Live Code file, supported from R2025a.
%[text] The economic specification follows [lecture4_extra.md](lecture4_extra.md). The experiments are illustrative classroom calculations, not estimates or forecasts of AI's effects.
%[text:tableOfContents]{"heading":"In this notebook"}

%%
%[text] ## 1. Solve a simple benchmark
%[text] ### Households, income and the bond
%[text] There are two dates and a unit mass of households. Everyone has the same income today and chooses a bond position before learning their individual future income. Half receive the low income and half the high income. There is no aggregate uncertainty, storage or production.
%[text] $y\_1=1,\\qquad y\_L=0.8,\\qquad y\_H=1.2,\\qquad \\pi\_L=\\pi\_H=1/2.$
%[text] A bond costs $q$ today and pays one unit tomorrow. The variable $a$ measures the future payoff: positive values mean lending and negative values mean borrowing. The gross return is $R=1/q$ and the net rate is $r=R-1$.
%[text] $c\_1=y\_1-qa,\\qquad c\_{2s}=y\_s+a,\\qquad -y\_L<a<y\_1/q.$
%[text] Preferences are CRRA, with log utility at unit risk aversion. The strict consumption bounds keep utility and marginal utility well defined during the numerical solve.
%[text] $u(c)=\\frac{c^{1-\\sigma}-1}{1-\\sigma}\\quad(\\sigma\\ne1),\\qquad u(c)=\\log(c)\\quad(\\sigma=1),\\qquad u'(c)=c^{-\\sigma}.$
%[text] The benchmark uses a single model period with no calendar interpretation. Thus its reported rate is a **net rate per model period**. The AI section will instead use ten-year periods and annualize the return.
par = struct('beta', 0.96, 'sigma', 2, 'y1', 1, ...
    'y2', [0.8; 1.2], 'prob', [0.5; 0.5], 'aMin', -Inf);
numerics = struct('householdTol', 1e-12, 'boundaryFraction', 1e-10, ...
    'marketTol', 1e-10, 'eulerTol', 1e-8, ...
    'qBracket', [0.5, 1.5], 'maxIterations', 150);
% aMin = -Inf means that only the natural borrowing limit restricts debt.
incomeTable = table(["Low"; "High"], par.prob, par.y2, ...
    'VariableNames', {'State', 'Probability', 'FutureIncome'});
disp(incomeTable)

%[text] ### Step 1: solve the household problem at a given price
%[text] Treat the price as fixed, just as a competitive household does. The household chooses its bond position to maximize expected lifetime utility:
%[text] $\\max\_a\\left\\{u(y\_1-qa)+\\beta\\sum\_s\\pi\_s u(y\_s+a)\\right\\}.$
%[text] The objective is strictly concave. Its derivative decreases in assets, so the interior optimum is the unique zero of the Euler residual:
%[text] $F(a;q)=-q(y\_1-qa)^{-\\sigma}+\\beta\\sum\_s\\pi\_s(y\_s+a)^{-\\sigma}=0.$
%[text] The helper `huggett_household` brackets this zero between the consumption-feasibility bounds and calls `fzero`. This solves the first-order condition, rather than searching a coarse asset grid. The grid below is only for illustrating the objective.
qTrial = 1;
[aTrial, householdTrial] = huggett_household(qTrial, par, numerics);
trialTable = table(qTrial, aTrial, householdTrial.c1, ...
    householdTrial.c2(1), householdTrial.c2(2), ...
    'VariableNames', {'Price', 'DesiredAssets', 'Consumption1', 'ConsumptionLow', 'ConsumptionHigh'});
disp(trialTable)

assetGrid = linspace(-0.65, 0.60, 401);
if par.sigma == 1
    utility = @(c) log(c);
else
    utility = @(c) (c.^(1 - par.sigma) - 1) / (1 - par.sigma);
end
lifetimeUtility = utility(par.y1 - qTrial * assetGrid) ...
    + par.beta * sum(par.prob .* utility(par.y2 + assetGrid), 1);
valueAtOptimum = utility(householdTrial.c1) ...
    + par.beta * sum(par.prob .* utility(householdTrial.c2));
figHousehold = figure('Name', 'Household choice', 'Color', 'w', ...
    'Position', [100, 100, 1050, 420]);
tiledlayout(1, 2, 'TileSpacing', 'compact');
nexttile
plot(assetGrid, lifetimeUtility, 'LineWidth', 2)
hold on
plot(aTrial, valueAtOptimum, 'o', 'MarkerFaceColor', [0.85, 0.33, 0.1])
xline(0, ':');
xlabel('Bond payoff a'); ylabel('Expected lifetime utility');
title('The household chooses the peak'); grid on
nexttile
plot(assetGrid, [par.y1 - qTrial * assetGrid; par.y2 + assetGrid]', 'LineWidth', 2)
xline(aTrial, '--', 'Optimal a');
xlabel('Bond payoff a'); ylabel('Consumption');
legend('Today', 'Future: low income', 'Future: high income', 'Location', 'best');
title('Saving transfers consumption across dates'); grid on
%[text] At the trial price, desired lending is positive. More saving lowers current consumption and raises consumption in both future states. It cannot eliminate the income gap between the two future states: the bond has the same payoff in each state.

%[text] ### Step 2: let the bond price clear the market
%[text] The bond is in zero net supply. Because households are identical when they choose assets, their common demand is also aggregate excess demand. There is no borrower group to absorb their desired lending at the trial price.
%[text] $Z(q)=a^d(q),\\qquad Z(q^\*)=0,\\qquad a^\*=0.$
%[text] We use price bisection. Start with positive excess demand at the lower price and negative excess demand at the upper price. Solve the household problem at the midpoint. Positive demand means the price must rise; negative demand means it must fall. Repeat until demand is close to zero. The helper expands the initial bracket if needed.
benchmark = huggett_equilibrium(par, numerics);
benchmarkTable = table(benchmark.q, benchmark.R, 100 * (benchmark.R - 1), ...
    benchmark.a, benchmark.iterations, ...
    'VariableNames', {'BondPrice', 'GrossReturn', 'NetRatePercent', 'Assets', 'BisectionIterations'});
disp(benchmarkTable)
%[text] **A check we can do by hand.** Insert zero bond holdings into the Euler equation. This gives a closed-form price that is independent of our bisection algorithm:
%[text] $q^\*=\\beta\\frac{\\sum\_s\\pi\_s y\_s^{-\\sigma}}{y\_1^{-\\sigma}},\\qquad R^\*=1/q^\*.$
qExact = par.beta * sum(par.prob .* par.y2.^(-par.sigma)) / par.y1^(-par.sigma);
qComplete = par.beta * (sum(par.prob .* par.y2) / par.y1)^(-par.sigma);
fprintf('Numerical versus exact price error: %.3e\n', abs(benchmark.q - qExact));
fprintf('Incomplete-markets net rate: %.3f%% per period\n', 100 * (benchmark.R - 1));
fprintf('Complete-markets net rate:   %.3f%% per period\n', 100 * (1 / qComplete - 1));
assert(abs(benchmark.q - qExact) < 1e-8);
assert(abs(benchmark.a) <= numerics.marketTol);
assert(abs(benchmark.c1 - par.y1) < 1e-8);
assert(max(abs(benchmark.c2 - par.y2)) < 1e-8);

priceGrid = linspace(0.75 * qExact, 1.25 * qExact, 101);
assetDemand = zeros(size(priceGrid));
for k = 1:numel(priceGrid)
    assetDemand(k) = huggett_household(priceGrid(k), par, numerics);
end
figEquilibrium = figure('Name', 'Bond-market equilibrium', 'Color', 'w', ...
    'Position', [100, 100, 1050, 420]);
tiledlayout(1, 2, 'TileSpacing', 'compact');
nexttile
plot(priceGrid, assetDemand, 'LineWidth', 2)
yline(0, 'k:'); xline(qExact, '--', 'Equilibrium');
xlabel('Bond price q'); ylabel('Excess bond demand a^d(q)');
title('A higher bond price discourages saving'); grid on
nexttile
semilogy(1:benchmark.iterations, max(abs(benchmark.history.ExcessDemand), eps), ...
    '-o', 'LineWidth', 1.5, 'MarkerSize', 3)
yline(numerics.marketTol, '--', 'Stopping tolerance');
xlabel('Bisection iteration'); ylabel('Absolute excess demand');
title('Market clearing by bisection'); grid on
%[text] The benchmark rate is negative. This is feasible here because the consumption good cannot be stored. A household cannot bypass the bond by carrying goods into the next period. With full insurance and constant aggregate income, the gross return would instead be the inverse of the discount factor.
%[text] **Why does risk lower the rate?** CRRA marginal utility is convex. Income risk raises expected future marginal utility and desired saving. The price rises, and the return falls, until everyone willingly holds zero assets. Actual equilibrium saving remains zero; equilibrium consumption equals each household's endowment.
%[text] **Try it.** Set both future incomes to one and rerun this section. Check that the price equals the discount factor. Then restore the income risk and explain the change in the return. If you impose a tighter negative borrowing limit, the equilibrium is unchanged because it remains slack. A zero borrowing limit instead makes the equilibrium price nonunique, so `huggett_equilibrium` deliberately requires some borrowing to be feasible.

%%
%[text] ## 2. AI experiments: expected growth versus earnings risk
%[text] ### A decade between today and tomorrow
%[text] We now interpret one period as ten years. Current income is one, the annual discount factor is 0.98, and baseline annual income growth is 1 percent. Risk aversion remains two. The income shocks are symmetric, so their mean is expected future income and their standard deviation is epsilon.
%[text] $\\beta=0.98^{10},\\qquad \\bar y\_2^{base}=(1+g)^{10},\\qquad y\_2=\\bar y\_2\\pm\\varepsilon.$
%[text] The model returns a ten-year gross return. Always compound to express it as an annual net rate:
%[text] $r\_{ann}=(R^\*)^{1/10}-1.$
%[text] There are three experiments. The second raises the future income level by 15 percent **on top of baseline growth**, holding the absolute earnings spread fixed. The third keeps this higher mean but widens the spread. These choices isolate two distinct channels.
years = 10;
betaAnnual = 0.98;
baselineGrowth = 0.01;
aiLevelGain = 0.15;
epsilonBase = 0.20;
epsilonAI = 0.40;
meanBase = (1 + baselineGrowth)^years;
meanAI = (1 + aiLevelGain) * meanBase;
aiPar = struct('beta', betaAnnual^years, 'sigma', 2, 'y1', 1, ...
    'y2', [meanBase - epsilonBase; meanBase + epsilonBase], ...
    'prob', [0.5; 0.5], 'aMin', -Inf);
numerics = struct('householdTol', 1e-12, 'boundaryFraction', 1e-10, ...
    'marketTol', 1e-10, 'eulerTol', 1e-8, ...
    'qBracket', [0.25, 1.5], 'maxIterations', 150);
scenario = ["Baseline"; "AI income boom"; "AI boom + earnings risk"];
meanIncome = [meanBase; meanAI; meanAI];
incomeRisk = [epsilonBase; epsilonBase; epsilonAI];
assert(all(meanIncome > incomeRisk), 'Low-state income must remain positive.');
fprintf('15%% extra income over a decade: %.3f%% annualized level-growth factor.\n', ...
    100 * ((1 + aiLevelGain)^(1 / years) - 1));
%[text] The last number is the annualized factor associated with the additional level gain. Total annual growth including the baseline trend compounds the two factors; it is not exactly their sum.

%[text] ### Solve each scenario and compare the rates
%[text] We reuse the numerical household and equilibrium solvers. We also compute the full-insurance rate at each scenario's mean income. With rising aggregate income that rate is no longer simply the inverse discount factor.
%[text] $R\_{CM}=\\frac{u'(y\_1)}{\\beta u'(\\bar y\_2)}=\\frac{(\\bar y\_2/y\_1)^\\sigma}{\\beta}.$
bondPrice = zeros(3, 1);
annualRate = zeros(3, 1);
annualRateCM = zeros(3, 1);
marketResidual = zeros(3, 1);
fixedPriceDemand = zeros(3, 1);
for s = 1:3
    experiment = aiPar;
    experiment.y2 = [meanIncome(s) - incomeRisk(s); meanIncome(s) + incomeRisk(s)];
    solution = huggett_equilibrium(experiment, numerics);
    bondPrice(s) = solution.q;
    annualRate(s) = solution.R^(1 / years) - 1;
    completeReturn = (meanIncome(s) / aiPar.y1)^aiPar.sigma / aiPar.beta;
    annualRateCM(s) = completeReturn^(1 / years) - 1;
    marketResidual(s) = solution.a;
    fixedPriceDemand(s) = huggett_household(bondPrice(1), experiment, numerics);
    exactPrice = experiment.beta * sum(experiment.prob .* ...
        experiment.y2.^(-experiment.sigma)) / experiment.y1^(-experiment.sigma);
    assert(abs(solution.q - exactPrice) < 1e-8);
end
incomeScenarios = table(scenario, meanIncome, incomeRisk, ...
    meanIncome - incomeRisk, meanIncome + incomeRisk, ...
    'VariableNames', {'Scenario', 'MeanIncome', 'Epsilon', 'LowIncome', 'HighIncome'});
disp(incomeScenarios)
% AnnualPct and InsuredPct are annual net interest rates, in percent.
aiResults = table(scenario, bondPrice, 100 * annualRate, ...
    100 * annualRateCM, marketResidual, ...
    'VariableNames', {'Scenario', 'BondPrice', 'AnnualPct', 'InsuredPct', 'Assets'});
disp(aiResults)

figAI = figure('Name', 'AI experiments', 'Color', 'w', ...
    'Position', [100, 100, 1100, 460]);
tiledlayout(1, 2, 'TileSpacing', 'compact');
nexttile
bar(1:3, 100 * [annualRate, annualRateCM], 'grouped')
xticks(1:3); xticklabels({'Baseline', 'AI boom', 'Boom + risk'});
ylabel('Annual net real rate (%)');
legend('Incomplete markets', 'Full insurance', 'Location', 'northwest');
title('The two AI channels pull in opposite directions'); grid on
nexttile
bar(1:3, fixedPriceDemand, 'FaceColor', [0.2, 0.6, 0.55])
yline(0, 'k:'); xticks(1:3); xticklabels({'Baseline', 'AI boom', 'Boom + risk'});
ylabel('Desired bond payoff at the baseline price');
title('What households want before prices adjust'); grid on
%[text] **Read the left panel.** Higher income in every future state lowers expected marginal utility and raises the equilibrium rate. Adding risk raises expected marginal utility and lowers the rate relative to the boom-only scenario. Whether it also falls below the baseline depends on the calibration.
%[text] **Read the right panel.** Every bar holds the price fixed at the baseline equilibrium price. The income boom encourages borrowing; extra risk shifts demand back toward saving. These are hypothetical demands before price adjustment. In the equilibrium table, assets are zero in all three scenarios, up to numerical tolerance.
fprintf('Income channel: %+0.3f percentage points per year.\n', 100 * (annualRate(2) - annualRate(1)));
fprintf('Added risk channel: %+0.3f percentage points per year.\n', 100 * (annualRate(3) - annualRate(2)));
fprintf('Combined change: %+0.3f percentage points per year.\n', 100 * (annualRate(3) - annualRate(1)));
assert(annualRate(2) > annualRate(1) && annualRate(3) < annualRate(2));
assert(all(annualRate < annualRateCM));
assert(max(abs(marketResidual)) <= numerics.marketTol);
assert(fixedPriceDemand(2) < 0 && fixedPriceDemand(3) > fixedPriceDemand(2));

%[text] ### Vary one mechanism at a time
%[text] The three scenarios give particular comparisons. We can see the wider pattern by varying the AI level gain at fixed earnings risk, then varying earnings risk at the AI mean income. The curves below use the closed form for speed, after verifying it against the numerical solver above.
%[text] $q(\\bar y\_2,\\varepsilon)=\\frac{\\beta}{2y\_1^{-\\sigma}}\\left[(\\bar y\_2-\\varepsilon)^{-\\sigma}+(\\bar y\_2+\\varepsilon)^{-\\sigma}\\right].$
aiGainGrid = linspace(0, 0.30, 121);
riskGrid = linspace(0, 0.60, 121);
meanGrid = meanBase * (1 + aiGainGrid);
priceAt = @(mu, risk) aiPar.beta / (2 * aiPar.y1^(-aiPar.sigma)) ...
    .* ((mu - risk).^(-aiPar.sigma) + (mu + risk).^(-aiPar.sigma));
rateFromPrice = @(q) (1 ./ q).^(1 / years) - 1;
incomeCurve = rateFromPrice(priceAt(meanGrid, epsilonBase));
riskCurve = rateFromPrice(priceAt(meanAI, riskGrid));
assert(all(diff(incomeCurve) > 0) && all(diff(riskCurve) < 0));
figSensitivity = figure('Name', 'AI comparative statics', 'Color', 'w', ...
    'Position', [100, 100, 1100, 440]);
tiledlayout(1, 2, 'TileSpacing', 'compact');
nexttile
plot(100 * aiGainGrid, 100 * incomeCurve, 'LineWidth', 2)
hold on
plot(100 * [0, aiLevelGain], 100 * annualRate(1:2), 'o', 'MarkerSize', 7)
xlabel('Additional AI income level after 10 years (%)');
ylabel('Annual net real rate (%)');
title('Higher mean income, fixed absolute risk'); grid on
nexttile
plot(riskGrid, 100 * riskCurve, 'LineWidth', 2)
hold on
plot([epsilonBase, epsilonAI], 100 * annualRate(2:3), 'o', 'MarkerSize', 7)
yline(100 * annualRate(1), '--', 'Baseline rate');
xlabel('Earnings risk epsilon (units of current income)');
ylabel('Annual net real rate (%)');
title('Higher risk, fixed AI mean income'); grid on
%[text] **How much risk would fully offset the boom?** Find the earnings spread at which the annual interest rate with AI equals the baseline rate. The interval below stays strictly within positive low-state income.
offsetRisk = fzero(@(risk) rateFromPrice(priceAt(meanAI, risk)) - annualRate(1), ...
    [epsilonBase, 0.95 * meanAI]);
fprintf('Earnings spread that offsets the income boom: epsilon = %.4f.\n', offsetRisk);
assert(abs(rateFromPrice(priceAt(meanAI, offsetRisk)) - annualRate(1)) < 1e-9);
%[text] ### Interpretation and exercises
%[text] This is a pure-exchange illustration of anticipated higher endowments. It does not model AI investment or production. Epsilon describes dispersion across individual earnings outcomes; uncertainty about whether AI transforms the whole economy would require aggregate risk and a different equilibrium environment.
%[text] 1. Change the extra AI income level from 15 percent to 5 percent. Predict what happens to the boom-only rate before rerunning section 2.
%[text] 2. Set the third scenario's spread above `offsetRisk`. Explain why its rate should now fall below the baseline.
%[text] 3. Compare holding the absolute spread fixed with holding the spread-to-mean ratio fixed. Which experiment isolates a pure upward shift of the income distribution?
%[text] 4. Set risk aversion to one in both sections. With current income normalized to one, verify the log-utility formula below. Then explain why the numerical solution still works. \
%[text] $R^\*=\\frac{\\bar y\_2^2-\\varepsilon^2}{\\beta\\bar y\_2}\\qquad(\\sigma=1,\ y\_1=1).$
%[text] **Takeaway.** The income channel raises the rate; the precautionary-saving channel lowers it. In this benchmark these forces change the price needed to clear the bond market, while aggregate saving remains zero.
disp('All notebook equilibrium and comparative-statics checks passed.')

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline","rightPanelPercent":35}
%---

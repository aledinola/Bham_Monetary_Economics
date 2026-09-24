%[text] # Lecture 4 extra: a two-period Huggett economy
%[text] This notebook extends the two-period consumption-saving model from Lecture 4 by adding uninsurable income risk and a bond market in zero net supply.
%[text] The aim is to introduce the main economic idea behind a Huggett economy in the simplest possible setting.
%
%[text] ## 1. The model
%[text] There is a unit mass of ex-ante identical households. Income today is the same for everyone, while future income is uncertain:
%[text] $y_1=1,\qquad y_2\in\{y_L,y_H\}.$
%[text] A household can buy a one-period bond. Let $a$ denote the amount the bond pays next period. The gross interest rate is $R$, so buying one unit of future payoff costs $1/R$ today.
%[text] The budget constraints are
%[text] $c_1=y_1-\frac{a}{R},\qquad c_2(z)=y_2(z)+a.$
%[text] Positive $a$ means saving and negative $a$ means borrowing.
%[text] Preferences are CRRA:
%[text] $u(c)=\frac{c^{1-\sigma}-1}{1-\sigma},\qquad u'(c)=c^{-\sigma}.$
%[text] The household Euler equation is
%[text] $u'(c_1)=\beta R\,E[u'(c_2)].$
%[text] The bond is in zero net supply. Since all households are identical when they choose $a$, equilibrium requires
%[text] $a(R^*)=0.$
%
%[text] ### Parameters
par.beta = 0.96;
par.sigma = 2;
par.y1 = 1;
par.y2 = [0.8; 1.2];
par.prob = [0.5; 0.5];

%% Household saving at a given interest rate
%[text] First take the interest rate as given. At $R=1$, solve the household problem.

Rtrial = 1;
[aTrial, c1Trial, c2Trial] = huggett_household(Rtrial, par);

trialResults = table(Rtrial, aTrial, c1Trial, c2Trial(1), c2Trial(2), ...
    'VariableNames', {'R', 'Assets', 'c1', 'c2Low', 'c2High'});
disp(trialResults)

%[text] With future income risk, the household has a precautionary motive to save.
%
%[text] ### Asset demand as a function of R
%[text] A higher return makes saving more attractive.

Rgrid = linspace(0.6, 1.3, 100);
assetDemand = zeros(size(Rgrid));

for i = 1:length(Rgrid)
    assetDemand(i) = huggett_household(Rgrid(i), par);
end

figure
plot(Rgrid, assetDemand, 'LineWidth', 2)
yline(0, 'k:')
xlabel('Gross interest rate R')
ylabel('Desired assets a(R)')
title('Household asset demand')
grid on

%% General equilibrium
%[text] In equilibrium, the interest rate adjusts until the bond market clears:
%[text] $a(R^*)=0.$

[Rstar, astar, c1star, c2star] = huggett_equilibrium(par);

equilibriumResults = table(Rstar, 100 * (Rstar - 1), astar, ...
    'VariableNames', {'GrossReturn', 'NetRatePercent', 'Assets'});
disp(equilibriumResults)

%[text] Because equilibrium assets are zero, the Euler equation also gives a closed-form expression:
%[text] $y_1^{-\sigma}=\beta R^* E[y_2^{-\sigma}],$
%[text] so
%[text] $R^*=\frac{y_1^{-\sigma}}{\beta E[y_2^{-\sigma}]}.$

Rexact = par.y1^(-par.sigma) / ...
    (par.beta * sum(par.prob .* par.y2.^(-par.sigma)));

fprintf('Numerical R = %.6f\n', Rstar)
fprintf('Closed-form R = %.6f\n', Rexact)

%[text] The important economic result is that income risk raises expected future marginal utility. Households want to save more for precautionary reasons. Since aggregate bond supply is zero, the equilibrium interest rate must fall until desired saving is zero.
%
%[text] ## 2. A short application: AI, future income and risk
%[text] We now interpret one model period as ten years. This example is only illustrative.
%[text] Two forces work in opposite directions:
%[text] - higher expected future income tends to raise the interest rate;
%[text] - greater future income risk tends to lower the interest rate through precautionary saving.

years = 10;

ai = par;
ai.beta = 0.98^years;
ai.y1 = 1;
ai.sigma = 2;

meanBase = 1.01^years;
meanBoom = 1.15 * meanBase;

scenario = ["Baseline"; "Higher future income"; "Higher income + more risk"];
meanIncome = [meanBase; meanBoom; meanBoom];
incomeRisk = [0.20; 0.20; 0.40];

annualRate = zeros(3,1);

for s = 1:3

    ai.y2 = [meanIncome(s) - incomeRisk(s); ...
             meanIncome(s) + incomeRisk(s)];

    R10 = huggett_equilibrium(ai);

    % R10 is a ten-year gross return.
    annualRate(s) = R10^(1 / years) - 1;

end

aiResults = table(scenario, meanIncome, incomeRisk, 100 * annualRate, ...
    'VariableNames', {'Scenario', 'MeanFutureIncome', 'IncomeRisk', 'AnnualRatePercent'});
disp(aiResults)

figure
bar(100 * annualRate)
xticks(1:3)
xticklabels({'Baseline', 'Income boom', 'Boom + risk'})
ylabel('Annual net real interest rate (%)')
title('Expected income and precautionary saving')
grid on

%[text] **Takeaway.** Higher expected future income pushes the interest rate up. More uninsurable future income risk pushes it down. In every equilibrium, aggregate bond holdings are still zero.

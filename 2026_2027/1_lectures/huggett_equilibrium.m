function eq = huggett_equilibrium(par, numerics)
% HUGGETT_EQUILIBRIUM Clear the zero-net-supply bond market by price bisection.
%
% INPUTS:
% par:      Scalar structure with preferences, incomes, probabilities and aMin
% numerics: Scalar structure with initial price bracket, tolerances and limits
%
% OUTPUTS:
% eq: Structure with price, return, demand, consumption and bisection history

assert(par.aMin < 0, ...
    'A unique equilibrium price requires some borrowing to be feasible.');
qLow = numerics.qBracket(1);
qHigh = numerics.qBracket(2);
assert(0 < qLow && qLow < qHigh, 'Use an ordered positive price bracket.');

% Establish opposite signs using household solves, without the closed form.
for expansion = 1:numerics.maxIterations
    aLow = huggett_household(qLow, par, numerics);
    aHigh = huggett_household(qHigh, par, numerics);
    if aLow > 0 && aHigh < 0
        break
    end
    if aLow <= 0
        qLow = qLow / 2;
    end
    if aHigh >= 0
        qHigh = 2 * qHigh;
    end
end
assert(aLow > 0 && aHigh < 0, 'Could not bracket market clearing.');

history = zeros(numerics.maxIterations, 4);
for iteration = 1:numerics.maxIterations
    q = (qLow + qHigh) / 2;
    [a, household] = huggett_household(q, par, numerics);
    history(iteration, :) = [q, a, qLow, qHigh];
    if abs(a) <= numerics.marketTol
        break
    elseif a > 0
        qLow = q;  % Excess demand: raise the bond price (lower the return).
    else
        qHigh = q;
    end
end
assert(abs(a) <= numerics.marketTol, 'Bond-market bisection did not converge.');
assert(abs(household.eulerResidual) < numerics.eulerTol, ...
    'Household Euler equation is insufficiently accurate.');
eq.q = q;
eq.R = 1 / q;
eq.a = a;
eq.c1 = household.c1;
eq.c2 = household.c2;
eq.eulerResidual = household.eulerResidual;
eq.iterations = iteration;
eq.history = array2table(history(1:iteration, :), ...
    'VariableNames', {'Price', 'ExcessDemand', 'LowerPrice', 'UpperPrice'});
end %end function

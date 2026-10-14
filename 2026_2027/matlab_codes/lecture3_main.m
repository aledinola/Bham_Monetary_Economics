% Simple permanent income model: same lifetime income, same consumption
% Lecture 3, slide 22: An important observation about our model
clear, clc, close all

% Only the timing of income differs between Ann and Bob.
household = ["Ann"; "Bob"];
y1   = [1.5; 0.5];
y2   = [0.5; 1.5];
r    = 0;
beta = 1;
W = y1 + y2/(1+r);              % Present discounted value of income

% Solve each household's saving problem independently.
a = zeros(2,1);
c1 = zeros(2,1);
c2 = zeros(2,1);
exitflag = zeros(2,1);

for i = 1:2
    a_min = -y2(i)/(1+r);       % Borrowing is allowed (a < 0).
    a_max = y1(i);
    myfun = @(a) obj_consumer(a,y1(i),y2(i),r,beta);
    [a(i),~,exitflag(i)] = fminbnd(myfun,a_min,a_max);
    c1(i) = y1(i)-a(i);
    c2(i) = y2(i)+(1+r)*a(i);
end

assert(all(exitflag > 0), 'The saving optimization did not converge.');
assert(all(isfinite([a; c1; c2])) && all([c1; c2] > 0), ...
    'The solution must be finite with positive consumption.');

% Both choose c1 = c2 = 1, up to numerical solver tolerance.
% Ann saves 0.5; Bob borrows 0.5. Income timing changes a, not consumption.
results = table(household,y1,y2,W,c1,c2,a, ...
    'VariableNames',{'Household','y1','y2','PDV','c1','c2','a'});
disp(results)

figure('Color','w','Position',[100 100 900 380]);
for i = 1:2
    subplot(1,2,i)
    plot([1 2],[y1(i) y2(i)],'-o','LineWidth',2)
    hold on
    plot([1 2],[c1(i) c2(i)],'--s','LineWidth',2)
    title(household(i))
    xlabel('Period')
    ylabel('Income and consumption')
    xticks([1 2])
    xlim([0.9 2.1])
    ylim([0 2])
    legend('Income','Consumption','Location','best')
    grid on
end
sgtitle('Same lifetime income, same consumption')

function F = obj_consumer(a,y1,y2,r,beta)
% OBJ_CONSUMER Return negative lifetime log utility.
%
% INPUTS:
% a: Scalar saving today (negative for borrowing)
% y1, y2: Scalar incomes today and tomorrow
% r: Scalar net interest rate
% beta: Scalar discount factor
%
% OUTPUTS:
% F: Scalar negative lifetime utility

c1 = y1-a;
c2 = y2+(1+r)*a;
utility = log(c1)+beta*log(c2);

F = -utility;

end %end function

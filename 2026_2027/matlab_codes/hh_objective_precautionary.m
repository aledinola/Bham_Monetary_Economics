function minus_value = hh_objective_precautionary(a, beta, r, y1, eps)
%HH_OBJECTIVE_PRECAUTIONARY Negative expected lifetime utility.
%
% The household chooses saving a before period-2 income is realized.
% fminbnd minimizes this function, which is why utility is multiplied by -1.

c1  = y1 - a;
c2L = 1 - eps + (1 + r) * a;
c2H = 1 + eps + (1 + r) * a;

value = log(c1) + beta * 0.5 * (log(c2L) + log(c2H));

minus_value = -value;

end

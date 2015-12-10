function f = funk_uppg4c(t, y)
    a = 0.2;
    f = [y(2), 6 * cos(y(2)/2) - (y(1)^3 + y(1) + a*y(2))]';


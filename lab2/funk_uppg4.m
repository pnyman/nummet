function f = funk_uppg4(t, y)
    a = 0.2;
    f = [y(2), - y(1) - a*y(2)]';

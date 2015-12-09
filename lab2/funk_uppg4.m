function f = funk_uppg4(t, y)
    a = 10;
    f = [y(2), - y(1) - a*y(2)]';

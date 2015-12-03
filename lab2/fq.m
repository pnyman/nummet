function f = fq(x)
    p = 1000;
    f = pi * ((1 -  atan(p*(x - 1)) / pi) ./ (2 - cos(pi * x))).^2;

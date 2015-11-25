h = 0.4;
xplot = [];
yplot = [];
for k = 1:20
    x = pi + h * (0:2)';
    y = sin(x);
    D1 = (y(2) - y(1)) / h;
    xplot = [xplot; D1];
    yplot = [yplot; h];
    h = h / 2;
end

hold on
loglog(xplot, yplot), grid

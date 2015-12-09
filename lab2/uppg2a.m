xplot = [];
yplot = [];
h = 0.1;
x = 1;
fprim = cos(x);
for k = 1:15
    % x = 1 + h * (0:1)';
    % y = sin(x);
    % D = (y(2) - y(1)) / h;
    D = (sin(x + h) - sin(x)) / h;
    e_T = abs(D - fprim);
    xplot = [xplot; h];
    yplot = [yplot; e_T];
    h = h / 10;
end

format long
disp([xplot yplot])
loglog(xplot, yplot)
axis([10e-15 1 10e-10 10e-1])
daspect([1 2 1])

print('img/fig2a','-dpdf')
system('pdfcrop --gscmd gs-noX11 img/fig2a.pdf img/fig2a.pdf');

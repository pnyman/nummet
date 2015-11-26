xplot = [];
yplot = [];
h = 0.1;
x = 1;
fprim = cos(x);
for k = 1:15
    D = (sin(x + h) - sin(x - h)) / (2 * h);
    e_T = abs(D - fprim);
    xplot = [xplot; h];
    yplot = [yplot; e_T];
    h = h / 10;
end
format long
disp([xplot yplot])
loglog(xplot, yplot)
axis([10e-15 1 10e-13 10e-1])
daspect([1 2 1])
print('fig2c','-dpdf')
system('pdfcrop --gscmd gs-noX11 fig2c.pdf fig2c.pdf');

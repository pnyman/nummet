%
% Numeriska metoder, lab 2, uppgift 1a
% Patrik Nyman, ht 2015
%

x = [91 121 162 182 213 244]';
y = [13.18 15.78 17.97 18.38 15.53 14.07]';

A = [ones(6,1) x x.^2 x.^3 x.^4 x.^5];
c = A \ y;
X = x(1):x(6);
P = c(1) + c(2)*X + c(3)*X.^2 + c(4)*X.^3 + c(5)*X.^4 + c(6)*X.^5;

P(157-90)
P(227-90)

figure('units','normalized','position',[.1 .1 .4 .4])
plot(x, y, 'x', X, P), grid
daspect([10 1 1])

Pm = spline(x, y, X);
hold on
plot(X, Pm, '--')
hold off
print('fig1a','-dpdf')
system('pdfcrop --gscmd gs-noX11 fig1a.pdf fig1a.pdf');

%
% Numeriska metoder, lab 2, uppgift 1b
% Patrik Nyman, ht 2015
%

x = [91 121 162 182 213 244]';
y = [13.18 15.78 17.97 18.38 15.53 14.07]';

% A = [ones(6,1) x];
% c = A \ y;
% yanp = A * c;
% plot(x, y, 'x', x, yanp), grid

d = polyfit(x, y, 2);
X = x(1):x(6);
P = polyval(d, X);
plot(x, y, 'x', X, P), grid
daspect([10 1 1])

P(157 - 90)

print('fig1b', '-dpdf')
system('pdfcrop --gscmd gs-noX11 fig1b.pdf fig1b.pdf');

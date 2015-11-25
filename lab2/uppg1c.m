%
% Numeriska metoder, lab 2, uppgift 1c
% Patrik Nyman, ht 2015
%

% lade till dag 365 med samma värde som dag 1
x = [1 32 60 91 121 162 182 213 244 274 305 335 365]';
y = [6.13 8.02 10.42 13.18 15.78 17.97 18.38 15.53 14.07 11.43 8.73 6.55 6.13]';

w = 2 * pi / 365;
A = [ones(13, 1) cos(w*x) sin(w*x)];
c = A \ y;
X = x(1):x(13);
F = c(1) + c(2) * cos(w*X) + c(3) * sin(w*X);

r = y - A * c;
fkvsum = r' * r
F(157)

subplot(1, 2, 1)
plot(x, y, 'r:x', X, F), grid
title('Anpassning med trigonometriskt uttryck')

subplot(1, 2, 2)
plot(x, r), grid
title('Residualkurva')

% set(gcf,'PaperUnits','inches','PaperPosition',[-1 0 5 3])
print('fig1c','-dpng')

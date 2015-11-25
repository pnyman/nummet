%
% Numeriska metoder, lab 2, uppgift 1b
% Patrik Nyman, ht 2015
%

x = [91 121 162 182 213 244]';
y = [13.18 15.78 17.97 18.38 15.53 14.07]';

A = [ones(6,1) x];

c = A \ y;
yanp = A * c;

plot(x, y, 'x', x, yanp), grid
print('fig1b', '-dpng')

yanp

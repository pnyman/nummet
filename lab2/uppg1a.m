%
% Numeriska metoder, lab 2, uppgift 1a
% Patrik Nyman, ht 2015
%

x = [91 121 162 182 213 244]';
y = [13.18 15.78 17.97 18.38 15.53 14.07]';

% datestr(122, 'dd mmm')

A = [ones(6,1) x x.^2 x.^3 x.^4 x.^5];
c = A \ y;
X = x(1):x(6);
P = c(1) + c(2)*X + c(3)*X.^2 + c(4)*X.^3 + c(5)*X.^4 + c(6)*X.^5;

P(157-90)
P(227-90)
% P(end)

% stem(x, y, ':')
% hold on
axis([80, 260, 13, 19])
plot(x, y, 'x', X, P), grid

Pm = spline(x, y, X);
hold on
plot(X, Pm, ':')
hold off
print('fig1a','-dpng')

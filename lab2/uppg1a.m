%
% Numeriska metoder, lab 2, uppgift 1a
% Patrik Nyman, ht 2015
%

x = [91 121 162 182 213 244]';  % dag nr
y = [13.18 15.78 17.97 18.38 15.53 14.07]';  % soluppgång

% datestr(122, 'dd mmm')

A = [ones(6,1) x x.^2 x.^3 x.^4 x.^5];
c = A \ y;
X = x(1):0.1:x(6);
P = c(1) + c(2)*X + c(3)*X.^2 + c(4)*X.^3 + c(5)*X.^4 + c(6)*X.^5;

% P(1)
% P(122-91)
% P(163-91)
% P(203-91)
% P(end)

stem(x, y, ':')
hold on
plot(X, P), grid

Pm = spline(x, y, X);
hold on
plot(X, Pm, ':')

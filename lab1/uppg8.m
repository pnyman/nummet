%
% Numeriska metoder, lab 1, uppg 8
% Patrik Nyman, ht 2015
%
function f = fun(x);
f = exp(-3.*x.^2) - log(x+0.6) + 1./(x-6);

% x = [2,3,4];
% y = uppg8(x)
% y = uppg8(x')
%
% x = 0:0.01:3;
% y = uppg8(x);
% plot(x,y), grid, title('e^(-3x^2)- ln(x+0.6) + 1/(x-6)')

%
% Numeriska metoder, lab 1, uppg 6
% Patrik Nyman, ht 2015
%
x = 0:0.1:5;
g = x.^3/20 - 2 - (x.^3) .* exp(-x);
plot(x, g), grid

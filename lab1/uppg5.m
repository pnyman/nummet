%
% Numeriska metoder, lab 1, uppg 5
% Patrik Nyman, ht 2015
%
x = 0:0.5:5;
f = x.^3/20 - 2 - exp(-x);
values = [x', f'];
disp(values)

%
% Numeriska metoder, lab 1, uppg 4
% Patrik Nyman, ht 2015
%
A = [2 1; 4 5];
B = [1 1; 2 3];
x = [7 9]';

C = A * B
D = B * A
F = A .* B
G = B .* A
z = A*x
p = z' * z
E = A' * A
q = x' * E * x

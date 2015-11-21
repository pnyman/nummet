%
% Numeriska metoder, lab 1, uppg 3b
% Patrik Nyman, ht 2015
%
x = 25*pi / 2;
eps = 0;

% fx = cos(x/50) - 1 / sqrt(2)
fx = cos((x + eps)/50) - 1 / sqrt(2)

while abs(fx) < 1e-3
    eps = eps + 0.00001;
    fx = cos((x + eps)/50) - 1 / sqrt(2);
end

eps

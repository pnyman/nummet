%
% Numeriska metoder, lab 1, uppg 11c
% Patrik Nyman, ht 2015
%

% ladda någon av filerna eiffel[1-4]
% load eiffel1; N = 261;
% load eiffel2; N = 399;
% load eiffel3; N = 561;
load eiffel4; N = 1592;

x = ones(2*N,1);

iter = 0;
q0 = 0;
dif = 1;

mark = cputime;

A = sparse(A);
[L, U] = lu(A);

while abs(dif) > 0.5e-9 % åtta korrekta siffror
    t = x / norm(x); % ||t||_2 = 1; optimering
    x = U \ (L \ t); % y = L \ t; x = U \ y;
    % x = A \ t;
    q = t' * x; % konvergerar mot dominanta egenvärdet
    dif = q - q0;
    q0 = q;
    iter = iter + 1;
end

N
egenvektor = x / norm(x);
lambda = 1 / q
iter

time = cputime - mark

% Resultat:
% eiffel1: lambda = 0.0055
% eiffel2: lambda = 0.0049
% eiffel3: lambda = 0.0044
% eiffel4: lambda = 0.0029

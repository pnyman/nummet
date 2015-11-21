%
% Numeriska metoder, lab 1, uppg 9d1
% Patrik Nyman, ht 2015
%

% rötter/startgissningar som fungerar: -1/2, 3
guess = 3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Gör först en referenslösning med 15 korrekta siffror
% med Newtons metod
x = guess;
h = 1;
iter = 1;
n = [];  % antal iterationer
e_n = [];  % |x_n - x|

while abs(h) > 0.5e-15  % vid 0.5e-16 inget resultat efter 500_000 iter
    f  = x - 4 .* sin(2.*x) - 3;
    fp = 1 - 8 .* cos(2.*x);
    h = f/fp;
    x_old = x;
    x = x - h;
    n = [n; iter];
    e_n = [e_n; abs(x - x_old)];
    iter = iter + 1;
end

newton_solution = x;

semilogy(n, e_n)
xlabel('Antal iterationer')
ylabel('|x_n - x|')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fixpunktsiteration

x = guess;
h = 1;
iter = 1;
n = [];  % antal iterationer
e_n = [];  % |x_n - x|

while abs(h) > 0.5e-11
    x_old = x;
    x = - sin(2*x) + 5*x/4 - 3/4;
    h = x - x_old;
    n = [n; iter];
    e_n = [e_n; abs(x - x_old)];
    iter = iter + 1;
end

hold on
semilogy(n, e_n)
% xlabel('Antal iterationer')
% ylabel('|x_n - x|')

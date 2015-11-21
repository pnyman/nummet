%
% Numeriska metoder, lab 1, uppg 9d2
% Patrik Nyman, ht 2015
%

% rötter/startgissningar som fungerar: -1/2, 3
guess = 3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Newtons metod
x = guess;
h = 1;
e_n = [];  % |x_n - x|

while abs(h) > 0.5e-15  % vid 0.5e-16 inget resultat efter 500_000 iter
    f  = x - 4 .* sin(2.*x) - 3;
    fp = 1 - 8 .* cos(2.*x);
    h = f/fp;
    x_old = x;
    x = x - h;
    e_n = [e_n; abs(x - x_old)];
end

newton_solution = x;

e_n1 = e_n(2:end);
e_n  = e_n(1:end-1);

loglog(e_n, e_n1)
xlabel('e_n')
ylabel('e_{n+1}')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fixpunktsiteration

x = guess;
h = 1;
e_n = [];  % |x_n - x|

while abs(h) > 0.5e-11
    x_old = x;
    x = - sin(2*x) + 5*x/4 - 3/4;
    h = x - x_old;
    e_n = [e_n; abs(x - x_old)];
end

e_n1 = e_n(2:end);
e_n  = e_n(1:end-1);

hold on
loglog(e_n, e_n1)

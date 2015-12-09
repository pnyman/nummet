%
% Numeriska metoder, lab 2, uppgift 3c
% Patrik Nyman, ht 2015
%

L = 2.6;

ref = quad(@fq, 0, L, 1e-14)
[I, fcnt] = quad(@fq, 0, L, 1e-6)

n = fcnt;
h = L / n;
% trapetsregeln
x = h * (0:n); f = fq(x);
T = h * (sum(f) - f(1) / 2 - f(n+1) / 2);
% Simpsons formel
n = 2*n; h = h/2; x = h * (0:n); f = fq(x);
Tt = h * (sum(f) - f(1) / 2 - f(n+1) / 2);
S = Tt + (Tt - T) / 3

eq = I - ref
es = S - ref

% loglog(hv, Eht, hv, Ehs), grid
% print('img/fig3b','-dpdf')
% system('pdfcrop --gscmd gs-noX11 img/fig3b.pdf img/fig3b.pdf');

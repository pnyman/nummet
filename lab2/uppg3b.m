L = 2.6;

% referenslösning
n = 1000000;
h = L / n;
% trapetsregeln
x = h * (0:n); f = fq(x);
T = h * (sum(f) - f(1) / 2 - f(n+1) / 2);
% Simpsons formel
n = 2*n; h = h/2;
x = h * (0:n); f = fq(x);
Tt = h * (sum(f) - f(1) / 2 - f(n+1) / 2);
% referensvärde
ref = Tt + (Tt - T) / 3;

hv = []; Eht = []; Ehs = []; Tv = [];
for n = (20:2:400)
    h = L / n;
    hv = [hv; h];
    % trapetsregeln
    x = h * (0:n); f = fq(x);
    T = h * (sum(f) - f(1) / 2 - f(n+1) / 2);
    e = abs(ref - T);
    Eht = [Eht; e];
    Tv = [Tv; T];

    % Simpsons formel
    n = 2*n; h = h/2;
    x = h * (0:n); f = fq(x);
    Tt = h * (sum(f) - f(1) / 2 - f(n+1) / 2);
    S = Tt + (Tt - T) / 3;
    e = abs(ref - S);
    Ehs = [Ehs; e];
end

loglog(hv, Eht, hv, Ehs), grid
% axis([1.5*10e-2 1.4 10e-12 1])
% daspect([5 1 1])
print('fig3b','-dpdf')
system('pdfcrop --gscmd gs-noX11 fig3b.pdf fig3b.pdf');

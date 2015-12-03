L = 2.6;
hv = []; nv = []; tv = []; sv = [];
for h = [0.10 0.05 0.025]
    % trapetsregeln
    n = L / h;
    x = h * (0:n); f = fq(x);
    T = h * (sum(f) - f(1) / 2 - f(n+1) / 2);
    hv = [hv; h]; nv = [nv; n]; tv = [tv; T];

    % Simpsons formel
    h = h / 2; n = L / h;
    x = h * (0:n); f = fq(x);
    Tt = h * (sum(f) - f(1) / 2 - f(n+1) / 2);
    S = Tt + (Tt - T) / 3;
    sv = [sv; S];
end

disp([nv hv tv sv])

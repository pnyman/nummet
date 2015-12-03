L = 2.6;
I = [];
h = 0.01;
while h > 1e-6
    n = L / h;
    % trapetsregeln
    x = h * (0:n); f = fq(x);
    T = h * (sum(f) - f(1) / 2 - f(n+1) / 2);
    I = [I T];
    h = h/2;
end

table = [];
for i = 1:length(I)-2
    table = [ table ; (I(i) - I(i+1)) / (I(i+1) - I(i+2)) ];
end

disp(table)

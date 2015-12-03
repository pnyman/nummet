t = 0:0.02:2;
ft = fw(t);
n = 10; h = 2/n;
x = h * (0:n);
f = fw(x);
T10 = h * (sum(f) - f(1) / 2 - f(n+1) / 2);
plot(0,0,'+', t,ft,':', x,f,'o', x,f)

%
% Numeriska metoder, lab 2, uppgift 4c
% Patrik Nyman, ht 2015
%


[T, Y] = ode45(@funk_uppg4c, [0 20], [0 0]);


plot(T, Y), grid
xlabel('tid (sekunder)')
ylabel('z(t)')
daspect([25 10 1])

print('img/fig4c','-dpdf')
system('pdfcrop --gscmd gs-noX11 img/fig4c.pdf img/fig4c.pdf');


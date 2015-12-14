%
% Numeriska metoder, lab 2, uppgift 4a.2
% Patrik Nyman, ht 2015
%

y = [1 0]'; % startvärden
t = 0; tslut = 20;
T = t; Y = y';
h = 0.21;
n = tslut / h;

for i = 1:n
    f = funk_uppg4(t, y);
    y = y + h * f;
    t = t + h;
    T = [T; t];
    Y = [Y; y'];
end

plot(T, Y(:,1)), grid
daspect([1 3 1])
% axis([0 20 0 1])
xlabel('tid (sekunder)')
ylabel('z(t)')

print('img/fig4a_2','-dpdf')
system('pdfcrop --gscmd gs-noX11 img/fig4a_2.pdf img/fig4a_2.pdf');

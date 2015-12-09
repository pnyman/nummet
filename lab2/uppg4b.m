%
% Numeriska metoder, lab 2, uppgift 4b
% Patrik Nyman, ht 2015
%



tslut = 20;
h = 0.1;

for j = 1:5

    t = 0;
    y = [1 0]'; % startvärden
    T = t; Y = y';
    n = tslut / h;

    for i = 1:n
        f = funk_uppg4(t, y);
        y = y + h * f;
        t = t + h;
        T = [T; t];
        Y = [Y; y'];
    end

    hold on
    plot(T, Y(:,1)), grid
    axis([0 20 -1 1])
    daspect([6 1 1])

    h = h / 2;
end

print('img/fig4b','-dpdf')
system('pdfcrop --gscmd gs-noX11 img/fig4b.pdf img/fig4b.pdf');

%
% Numeriska metoder, lab 2, uppgift 4b_3
% Patrik Nyman, ht 2015
%

tslut = 20;
h = 0.1;

% for j = 1:5

    t = 0;
    y = [1 0]'; % startvärden
    T = t; Y = y';
    n = tslut / h;

    for i = 1:n
        f1 = funk_uppg4(t, y);
        f2 = funk_uppg4(t + h/2, y + h*f1/2);
        f3 = funk_uppg4(t + h/2, y + h*f2/2);
        f4 = funk_uppg4(t + h, y + h*f3);
        y = y + h/6 * (f1 + 2*f2 + 2*f3 + f4);
        t = t + h;
        T = [T; t];
        Y = [Y; y'];
    end

    hold on
    plot(Y(:,1), Y(:,2)), grid
    % axis([0 20 -1 1])
    % daspect([6 1 1])
    xlabel('z(t)')
    ylabel('z-prim(t)')

    % comet(Y(:,1), Y(:,2))

    h = h / 2;
% end

print('img/fig4b_3','-dpdf')
system('pdfcrop --gscmd gs-noX11 img/fig4b_3.pdf img/fig4b_3.pdf');


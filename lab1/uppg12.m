%
% Numeriska metoder, lab 1, uppg 12
% Patrik Nyman, ht 2015
%

a = 2; L1 = 1; L2 = 1;
L3v = [1 1 2 1];
m1v = [1 1 1 10];
m2v = [1 2 1 1];

for i = [1, 2, 3, 4]
    iter = 0;
    dunorm = 1;
    e_n = [];

    % parameteruppsättning
    L3 = L3v(i);
    m1 = m1v(i);
    m2 = m2v(i);

    % begynnelsevärden
    if i == 1
        u = [pi/3 0 -pi/3]';
    elseif i == 2
        u = [pi/4 pi/12 -5*pi/12]';
    elseif i == 3
        u = [5*pi/12 pi/4 -pi/3]';
    elseif i == 4
        u = [5*pi/12 -pi/7 -pi/6]';
    end

    uu = u;

    while dunorm > 0.5e-12 && iter < 100

        % de tre funktionerna
        eqv1 = L1 * cos(u(1)) + L2 * cos(u(2)) + L3 * cos(u(3)) - a;
        eqv2 = L1 * sin(u(1)) + L2 * sin(u(2)) + L3 * sin(u(3));
        eqv3 = m2 * tan(u(1)) - (m1 + m2) * tan(u(2)) + m1 * tan(u(3));

        % partialderivator
        eqv1p = [-L1 * sin(u(1));
                 -L2 * sin(u(2));
                 -L3 * sin(u(3))];
        eqv2p = [L1 * cos(u(1));
                 L2 * cos(u(2));
                 L3 * cos(u(3))];
        eqv3p = [m2 * (sec(u(1)))^2;
                 - (m1 + m2) * (sec(u(2)))^2;
                 m1 * (sec(u(3)))^2];

        % matriser av funktionerna och derivatorna
        f = [eqv1; eqv2; eqv3];
        J = [eqv1p'; eqv2p'; eqv3p'];

        du = - J \ f;
        u = u + du;
        dunorm_old = dunorm;
        dunorm = norm(du, inf);
        e_n = [e_n; abs(dunorm - dunorm_old)];
        iter = iter + 1;
    end

    x1 = cos(u(1)) * L1;
    x2 = x1 + cos(u(2)) * L2;

    y1 = - sin(u(1)) * L1;
    y2 = y1 - sin(u(2)) * L2;

    x = [0 x1 x2 2];
    y = [0 y1 y2 0];

    d1 = num2str(round(radtodeg(u(1)), 2));
    d2 = num2str(round(radtodeg(u(2)), 2));
    d3 = num2str(round(radtodeg(u(3)), 2));

    r1 = strcat('π/', num2str(round(pi/u(1), 2)));
    r2 = strcat('π/', num2str(round(pi/u(2), 2)));
    r3 = strcat('π/', num2str(round(pi/u(3), 2)));

    s1 = strcat('π/', num2str(pi/uu(1)));
    s2 = strcat('π/', num2str(pi/uu(2)));
    s3 = strcat('π/', num2str(pi/uu(3)));

    subplot(2, 2, i)
    plot(x, y)

    str1 = {
            ['Parameteruppsättning ', num2str(i)],
        };

    str2 = {
            ['Startgissning: ', s1, ', ', s2, ', ', s3]
            ['Radianer: ', r1, ', ', r2, ', ', r3]
            ['Grader: ', d1, ', ', d2, ', ', d3],
        };

    title(str1)
    xlabel(str2)

    e_n
    konvergens_x = e_n(1:end - 1);
    konvergens_y = e_n(2:end);
    hold on
    loglog(konvergens_x, konvergens_y)
end

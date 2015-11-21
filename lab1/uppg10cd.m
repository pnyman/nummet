%
% Numeriska metoder, labb 1, uppgift 10c-d
% Patrik Nyman, ht 2015
%

% ladda någon av filerna eiffel[1-4]
load eiffel1; N = 261;
% load eiffel2; N = 399;
% load eiffel3; N = 561;
% load eiffel4; N = 1592;


largenorm = -inf;
smallnorm = inf;
largenode = 0;
smallnode = 0;
j = 1;

t = cputime;

A = sparse(A);
[L, U] = lu(A);

while j * 2 - 1 < 2 * N
    B = zeros(2 * N, 1);
    B(j * 2 - 1) = 1;

    % alt: med LU-dekomposition
    X = U \ (L \ B); % Y = L \ B; X = U \ Y;

    % alt: med normal gausseliminering
    % X = A \ B;

    xnorm = norm(X);

    if xnorm > largenorm
        largenorm = xnorm;
        largenode = j;
    end

    if xnorm < smallnorm
        smallnorm = xnorm;
        smallnode = j;
    end

    j = j + 1;
end

cputime - t

xlarge = xnod(largenode);
ylarge = ynod(largenode);
xsmall = xnod(smallnode);
ysmall = ynod(smallnode);

trussplot(xnod, ynod, bars, 'b')
hold on
l = plot(xlarge, ylarge, 'r+');
set(l, 'linewidth', 2); % default value is 0.5
hold on
s = plot(xsmall, ysmall, 'g+');
set(s, 'linewidth', 2); % default value is 0.5

% Tidsåtgång för lösning av ekvationssystem
%
% N = 399:
%     gauss:
%         utan sparse: 37.61
%         med  sparse:  1.58
%     LU:
%         utan sparse:  3.02
%         med  sparse:  0.15
%
% N = 1592:
%     LU:
%         med  sparse:  4.76

%
% Numeriska metoder, lab 1, uppg 9b
% Patrik Nyman, ht 2015
%

results = [];

for x = [-1, -1/2, 7/4, 3, 9/2]
    guess = x;
    h = 1;
    while abs(h) > 0.5e-11
        x_old = x;
        x = - sin(2*x) + 5*x/4 - 3/4;
        h = x - x_old;
    end
    results = [results; [guess, x_old]];
end

results

% diary filnamn skriver till fil
% diary off

% För ingångsvärdena x = -1/2 och x = 3 erhålls värden som ligger nära de man
% får med Newton-Raphsons metod. Övriga värden avviker, i synnerhet vid
% x = -1, som som gåt mot - oändligheten.

% f(x)       = - sin(2x) + 5x/4 - 3/4
% f'(x)      = -2 cos(2x) + 5/4
% |f'(-1)|   =~ |2.08|  > 1
% |f'(-1/2)| =~ |0.17|  < 1
% |f'(2)|    =~ |2.56|  > 1
% |f'(3)|    =~ |-0.67| < 1
% |f'(9/2)|  =~ |3.07|  > 1

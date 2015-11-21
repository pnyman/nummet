%
% Numeriska metoder, labb 1, uppgift 10b
% Patrik Nyman, ht 2015
%

obekanta = [261 399 561 1592];
resultat = [];

for i = 1:4
    % ladda filerna eiffel[1-4] en efter en
    fil = strcat('eiffel', num2str(i)); % eiffel1, etc.
    load(fil)

    % hämta rätt antal obekanta för den laddade filen;
    % konstruera matrisen b
    N = obekanta(i);
    b = zeros(2*N,1);
    b(100) = 1;

    % lös Ax = b med gausseleminering k antal ggr
    % mät hur lång tid det tar
    time = 0;
    k = 10;
    for i = 1:k
        t = cputime;
        x = A\b;
        time = time + cputime - t;
    end

    % spara medelvärdet av tidsåtgången
    resultat = [resultat; time/k];
end

resultat

hold on;
loglog(obekanta, resultat, '-b')

% tiden skall vara 2/3 n^3 + n^2

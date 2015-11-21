%
% Numeriska metoder, lab 1, uppg 11b
% Patrik Nyman, ht 2015
%

load eiffel1;

%
% Hämta de fyra minsta egenvärdena ur A.
% D innehåller egenvärdena i en diagonal matris,
% V har motsvarande egenvektorer som kolumner
%
[V,D] = eigs(A,4,'sm');

%
% Ta ut en av egenvektorerna ur V (parametern i anger vilken)
% och motsvarande egenvärde.
%
i = 4;
x = V(1:end,i);
eigen = D(i,i);
amplitud = sqrt(eigen);

%
% Om inte förskjutningen syns bra, prova att göra egenvektorn
% längre genom att multiplicera den med ett tal större än ett.
%
x = x*4;

%
% Räkna ut koordinaterna för det belastade tornet.
%
xbel = xnod + x(1:2:end);
ybel = ynod + x(2:2:end);

%
% Plotta båda tornen i samma fönster.
%
% trussplot(xnod,ynod,bars,'b')
% hold on
trussplot(xbel,ybel,bars,'r')
title(['Horisontell forskjutning med frekvens ', num2str(amplitud)])

% fungerar ej?
% trussanim(xbel,ybel,bars,amplitud)

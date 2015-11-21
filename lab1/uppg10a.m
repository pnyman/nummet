%
% Numeriska metoder, lab 1, uppg 10a
% Patrik Nyman, ht 2015
%

%
% ladda någon av filerna eiffel[1-4]
%
load eiffel1; N = 261; j = 171;
% load eiffel2; N = 399; j = 271;
% load eiffel3; N = 561; j = 490;
% load eiffel4; N = 1592; j = 1500;

%
% belasta noden j med kraften 1 rakt högerut
%
b = zeros(2*N,1);
b(j*2-1) = 1;

%
% lös ekvationssystemet Ax = b
%
x = A\b;
%
% räkna ut koordinaterna för det belastade tornet
%
xbel = xnod + x(1:2:end);
ybel = ynod + x(2:2:end);

%
% plotta båda tornen i samma fönster
%
trussplot(xnod,ynod,bars,'b')
hold on
trussplot(xbel,ybel,bars,'r')

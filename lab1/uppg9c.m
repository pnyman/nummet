%
% Numeriska metoder, lab 1, uppg 9c
% Patrik Nyman, ht 2015
%

% fem rötter, ca -1, -1/2, 7/4, 3, 9/2

tolerans = 0.5e-11;
roots = [];

for x = [-1, -1/2, 7/4, 3, 9/2]
    h = 1;
    data = [];
    iter = 1;
    while abs(h) > tolerans
        f  = x - 4 .* sin(2.*x) - 3;
        fp = 1 - 8 .* cos(2.*x);
        h = f/fp;
        data = [data; iter x f fp h];
        x = x - h;
        iter = iter + 1;
    end
    roots = [roots; x];
    % data
    % x
end
roots

% x
% data


% fzero(fx,3)
% fzero(fpx,3)


% while abs(h) > 1e-7
%     h = -f/fp;
%     x = x+h;
% end
% alfa = x;
% Ealfa = h;

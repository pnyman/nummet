## Uppgift 1a

Jag har anpassat ett femtegradspolynom av formen
$c_1 + c_2x + c_3x^2 + c_4x^3 + c_5x^2 + c_6x^5$ till punkterna.
Det ger följande ekvationssystem för indata.

$$
\begin{pmatrix}
1 & 91 & 91^2 & 91^3 & 91^4 & 91^5 \\
1 & 121 & 121^2 & 121^3 & 121^4 & 121^5 \\
1 & 162 & 162^2 & 162^3 & 162^4 & 162^5 \\
1 & 182 & 182^2 & 182^3 & 182^4 & 182^5 \\
1 & 213 & 213^2 & 213^3 & 213^4 & 213^5 \\
1 & 244 & 244^2 & 244^3 & 244^4 & 244^5
\end{pmatrix}
\begin{pmatrix}
c_1 \\ c_2 \\ c_2 \\ c_4 \\ c_5 \\ c_6
\end{pmatrix}
=
\begin{pmatrix}
13.18 \\ 15.78 \\ 17.97 \\ 18.38 \\ 15.53 \\ 14.07
\end{pmatrix}
$$

Det löses med Gausselimination och plottas i <span
style='font-variant:small-caps;'>matlab</span>.  Som jämförelse har jag
också plottat samma data med <span
style='font-variant:small-caps;'>matlab</span>s ``spline``-kommando.
Resultatet visas i figur @fig:fig1a.

~~~matlab
x = [91 121 162 182 213 244]';
y = [13.18 15.78 17.97 18.38 15.53 14.07]';
A = [ones(6,1) x x.^2 x.^3 x.^4 x.^5];
c = A \ y;
X = x(1):x(6);
P = c(1) + c(2)*X + c(3)*X.^2 + c(4)*X.^3 + c(5)*X.^4 + c(6)*X.^5;
stem(x, y, ':')
hold on
axis([80, 260, 13, 19])
plot(X, P), grid
Pm = spline(x, y, X);
hold on
plot(X, Pm, ':')
P(157 - 90)
P(227 - 90)
~~~

Hur länge solen var uppe en viss dag ges av ``P(dagnr - 90)``. Det ger att 6
juni (dag\ 157) var solen uppe 17.69\ h, och 15 augusti (dag\ 227) var den
uppe 13.73\ h.

![Anpassning med femtegradspolynom och med spline (streckad linje)](fig1a.png){#fig:fig1a}


## Uppgift 1b

~~~matlab
x = [91 121 162 182 213 244]';  % dag nr
y = [13.18 15.78 17.97 18.38 15.53 14.07]';  % soluppgång
A = [ones(6,1) x];
c = A \ y;
yanp = A * c;
plot(x, y, 'x' , x, yanp), grid
~~~

Här varierar solens uppetid mellan 15.42\ h och 16.2\ h (värdena i ``yanp``).

![Anpassning med minstakvadratmetoden](fig1b.png){#fig:fig1b}

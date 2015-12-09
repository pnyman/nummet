1. Interpolation och minstakvadratanpassning
===

## Uppgift 1a

Vi skall anpassa ett femtegradspolynom
$c_1 + c_2x + c_3x^2 + c_4x^3 + c_5x^2 + c_6x^5$ till mätdata,
och därmed lösa ett ekvationssystem av följande typ.

$$
\begin{pmatrix}
1 & x_1 & x_1^2 & x_1^3 & x_1^4 & x_1^5 \\
1 & x_2 & \ldots & \ldots & \ldots & x_2^5 \\
\vdots & \vdots & \vdots & \vdots & \vdots & \vdots \\
1 & x_5 & \ldots & \ldots & \ldots & x_5^5 \\
\end{pmatrix}
\mathbf{c} = \mathbf{y}
$$

Det görs med Gausselimination och plottas i <span
style='font-variant:small-caps;'>matlab</span>.  Som jämförelse plottas
samma data med <span style='font-variant:small-caps;'>matlab</span>s
`spline`-kommando.  Resultatet visas i figur @fig:fig1a.

![Anpassning med femtegradspolynom och med spline (streckad linje)](img/fig1a.pdf){#fig:fig1a}


6 juni (dag\ 157) var solen uppe 17.69\ h, och 15 augusti (dag\ 227) var
den uppe 13.73\ h.


## Uppgift 1b

Här har <span style='font-variant:small-caps;'>matlab</span>s
`polyfit` och `polyval` använts för att anpassa ett andragradspolynom till
mätpunkterna. Soltiden för den 6\ juni blir 17.73\ h med denna modell. Se
figur @fig:fig1b.

![Anpassning med andragradspolynom](img/fig1b.pdf){#fig:fig1b}


## Uppgift 1c

Här använder vi som modellfunktion
$c_1 + c_2 \cos{\omega t} + c_3 \sin{\omega t}$, där $\omega = 2\pi/365$.
Eftersom vi har cykliska data med en period på 365 dagar bör det ge en god
anpassning. Data har kompletterats så att hela året täcks. Residualkurvan
har plottats separat. Resultatet visas i figur @fig:fig1c.

Felkvadratsumman fås som $\mathbf{r}^T \mathbf{r}$, där $\mathbf{r}$ är
residualvektorn, och är $1.9750$.
Nationaldagens soltid är `F(157)` $= 17.7654$.

![Anpassning med trigonometriskt uttryck och residualkurva](img/fig1c.pdf){#fig:fig1c}


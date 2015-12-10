
4. Ordinära differentialekvationer
===

## Uppgift 4a

Vi skriver om ekvationen $mz''+ \alpha z' + kz = 0$ som ett system av
första ordningens ekvationer. Låt $y_1 = z$ och $y_2 = z'$. Det ger:

$$
\begin{cases}
y'_1 = y_2 \\
y'_2 = - (ky_1 + \alpha y_2) / m.
\end{cases}
$$

Eftersom $m=k=1$ i uppgiften kan detta förenklas till

$$
\begin{cases}
y'_1 = y_2, & y_1(0) = 1\\
y'_2 = - (y_1 + \alpha y_2), & y_2(0) = 0.
\end{cases}
$$

På vektorform kan det uttryckas som $\mathbf{y'} =
\mathbf{f}(t, \mathbf{y})$ där $\mathbf{f} = (y_2, -(y_1 + \alpha y_2))$.

Med $\alpha = 10$ och steget $h = 0.1$ fram till $t = 20$ blir resultatet
som i figur @fig:fig4a.

\newpage

![Euler explicit med $\alpha = 20$](img/fig4a.pdf){#fig:fig4a}


## Uppgift 4b

Med $\alpha = 0.2$ och fem lösningar med halverade tidssteg blir resultatet
som i figur @fig:fig4b.

Samma parametrar med Runge-Kutta 4-metoden ger
resultatet i @fig:fig4b_2. Som synes sammanfaller alla fem lösningar, och
ser ut att vara ungefär desamma som lösning 5 i explicit Euler. Tidssteget
kan alltså vara åtminstone $1/0.5^4 = 16$ ggr längre.

Plottning i fasplanet ger kurvan i figur @fig:fig4b_2. Rörelsen går utifrån
och in mot mitten av spiralen.

![Euler explicit med $\alpha = 0.2$](img/fig4b.pdf){#fig:fig4b}

![Runge-Kutta 4 med $\alpha = 0.2$](img/fig4b_2.pdf){#fig:fig4b_2}

![Runge-Kutta 4 i fasplanet med $\alpha = 0.2$](img/fig4b_3.pdf){#fig:fig4b_3}


## Uppg 4c

Som i föregående uppgift skriver vi om ekvationen $mz''+ \alpha z' + kz +
z^3 = 6 \cos{t/2}$ som ett system av första ordningens ekvationer.
Låt $y_1 = z$ och $y_2 = z'$. Det ger (med $m=k=1$):

$$
\begin{cases}
y'_1 = y_2, & y_1(0) = 0 \\
y'_2 = 6 \cos(t/2) - (y_1^3 + y_1 + \alpha y_2), & y_2(0) = 0.
\end{cases}
$$

På vektorform skriver vi $\mathbf{y'} = \mathbf{f}(t, \mathbf{y})$ där
$\mathbf{f} = (y_2, 6 \cos(t/2) - (y_1^3 + y_1 + \alpha y_2))$.

Med `ode45(@funk_uppg4c, [0 20], [0 0])` blir resultatet som i
figur @fig:fig4c.

![ode45 med $\alpha = 0.2$](img/fig4c.pdf){#fig:fig4c}


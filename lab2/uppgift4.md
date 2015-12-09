4. Ordinära differentialekvationer
===

## Uppgift 4a

Vi skriver om ekvationen $mz''+ \alpha z' + kz = 0$ som ett system av
första ordningens elvationer. Låt $y_1 = z$ och $y_2 = z'$. Det ger:

$$
\begin{cases}
y'_1 = y_2 \\
y'_2 = - (ky_1 + \alpha y_2) / m.
\end{cases}
$$

Eftersom $m=k=1$ i uppgiften kan detta förenklas till

$$
\begin{cases}
y'_1 = y_2 & y_1(0) = 1\\
y'_2 = - (y_1 + \alpha y_2) & y_2(0) = 0.
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

![Euler explicit med $\alpha = 0.2$](img/fig4b.pdf){#fig:fig4b}


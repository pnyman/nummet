
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

Skriver vi om ekvationssystemet på matrisform får vi

$$
\begin{pmatrix}
y'_1 \\ y'_2
\end{pmatrix}
= A
\begin{pmatrix}
y_1 \\ y_2
\end{pmatrix}
=
\begin{pmatrix*}[r]
0 & 1 \\
-1 & -\alpha
\end{pmatrix*}
\begin{pmatrix}
y_1 \\ y_2
\end{pmatrix}
= \big[\alpha = 10\big] =
\begin{pmatrix*}[r]
0 & 1 \\
-1 & -10
\end{pmatrix*}
\begin{pmatrix}
y_1 \\ y_2
\end{pmatrix}.
$$

Egenvärdena $\lambda_n$ för $A$ är $-5-2\sqrt{6}$ och $-5+2\sqrt{6}$.  För
Framåt Euler når vi absolutstabilitet då $h < 2/|\lambda_n|$.  Det minsta
värdet är $2/(-5-2\sqrt{6}) \approx 0.2$.  Vi plottar en lösning
med $h=0.21$ (fig @fig:fig4a_2), och kan konstatera att den mycket riktigt
är instabil.


~~~matlab
    function f = funk_uppg4(t, y)
        a = 10;
        % a = 0.2;
        f = [y(2), - y(1) - a*y(2)]';

    y = [1 0]'; % startvärden
    t = 0; tslut = 20;
    T = t; Y = y';
    h = 0.1; n = tslut / h;
    for i = 1:n
        f = funk_uppg4(t, y);
        y = y + h * f;
        t = t + h;
        T = [T; t];
        Y = [Y; y'];
    end
    plot(T, Y(:,1)), grid
~~~

![Framåt Euler med $\alpha = 10, h=0.1$](img/fig4a.pdf){#fig:fig4a}

![Framåt Euler med $\alpha = 10, h=0.21$](img/fig4a_2.pdf){#fig:fig4a_2}


## Uppgift 4b

Med $\alpha = 0.2$ och fem lösningar med halverade tidssteg blir resultatet
som i figur @fig:fig4b.

Samma parametrar med Runge-Kutta 4-metoden ger
resultatet i @fig:fig4b_2. Som synes sammanfaller alla fem lösningar, och
ser ut att vara ungefär desamma som lösning 5 i explicit Euler. Tidssteget
kan alltså vara åtminstone $1/0.5^4 = 16$ ggr längre.

Plottning i fasplanet ger kurvan i figur @fig:fig4b_2. Rörelsen går utifrån
och in mot mitten av spiralen.

![Framåt Euler med $\alpha = 0.2$](img/fig4b.pdf){#fig:fig4b}

![Runge-Kutta 4 med $\alpha = 0.2$](img/fig4b_2.pdf){#fig:fig4b_2}

![Runge-Kutta 4 i fasplanet med $\alpha = 0.2$](img/fig4b_3.pdf){#fig:fig4b_3}


~~~matlab
    function f = funk_uppg4(t, y)
        a = 0.2;
        f = [y(2), - y(1) - a*y(2)]';

    tslut = 20; h = 0.1;
    for j = 1:5
        t = 0; y = [1 0]';
        T = t; Y = y'; n = tslut / h;
        for i = 1:n
            f = funk_uppg4(t, y);
            y = y + h * f; t = t + h;
            T = [T; t]; Y = [Y; y'];
        end
        hold on
        plot(T, Y(:,1)), grid
        h = h / 2;
    end
~~~

~~~matlab
    tslut = 20; h = 0.1;
    for j = 1:5
        t = 0; y = [1 0]';
        T = t; Y = y'; n = tslut / h;
        for i = 1:n
            f1 = funk_uppg4(t, y);
            f2 = funk_uppg4(t + h/2, y + h*f1/2);
            f3 = funk_uppg4(t + h/2, y + h*f2/2);
            f4 = funk_uppg4(t + h, y + h*f3);
            y = y + h/6 * (f1 + 2*f2 + 2*f3 + f4);
            t = t + h; T = [T; t]; Y = [Y; y'];
        end
        hold on
        plot(T, Y(:,1)), grid
        h = h / 2;
    end
~~~

~~~matlab
    tslut = 20; h = 0.1; t = 0; y = [1 0]';
    T = t; Y = y'; n = tslut / h;
    for i = 1:n
        f1 = funk_uppg4(t, y);
        f2 = funk_uppg4(t + h/2, y + h*f1/2);
        f3 = funk_uppg4(t + h/2, y + h*f2/2);
        f4 = funk_uppg4(t + h, y + h*f3);
        y = y + h/6 * (f1 + 2*f2 + 2*f3 + f4);
        t = t + h; T = [T; t]; Y = [Y; y'];
    end
    plot(Y(:,1), Y(:,2)), grid
    % comet(Y(:,1), Y(:,2))
    h = h / 2;
~~~

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
Resultatet visas i figur @fig:fig4c.

![ode45 med $\alpha = 0.2$](img/fig4c.pdf){#fig:fig4c}


~~~matlab
    function f = funk_uppg4c(t, y)
        a = 0.2;
        f = [y(2), 6 * cos(y(2)/2) - (y(1)^3 + y(1) + a*y(2))]';

    [T, Y] = ode45(@funk_uppg4c, [0 20], [0 0]);
    plot(T, Y), grid
~~~


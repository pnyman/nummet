
\newpage

2. Numerisk derivering och noggrannhetsordning
===

## Uppgift 2a--b

Vi skall approximera $f'(1)$, där $f(x) = \sin(x)$, med hjälp av
framåtdifferens.

$$
e_T = \frac{f(x+h) - f(x)}{h} - f'(x).
$$

Vi plottar felet med `loglog` i  <span
style='font-variant:small-caps;'>matlab</span>. Resultatet visas i figur
@fig:fig2a. Detta är en första ordningen approximation, så felet skall vara
$\mathcal{O}(h)$, vilket framgår av figuren där kurvan (uppskattningsvis)
har lutningen 1 för $h > 10^{-8}$.

I tabell 1 ser vi hur $e_T$ förändras allt eftersom $h$ krymper. Vid $h =
10^{-8}$ har vi nått det minsta felet på $2.969885 \cdot 10^{-9}$,
därefter ökar $e_T$ igen pga. de avrundningsfel som uppstår när vi
subtraherar tal med liten differens. Detta syns också i grafen.

: Absolutfelet $e_T$ vid framåtdifferens

|       $h$          |      $e_T$        |
|:------------------:|:-----------------:|
| 0.100000000000000  | 0.042938553332751 |
| 0.010000000000000  | 0.004216324856271 |
| 0.001000000000000  | 0.000420825507813 |
| 0.000100000000000  | 0.000042074449519 |
| 0.000010000000000  | 0.000004207362275 |
| 0.000001000000000  | 0.000000420746810 |
| 0.000000100000000  | 0.000000041827691 |
| 0.000000010000000  | 0.000000002969885 |
| 0.000000001000000  | 0.000000052541266 |
| 0.000000000100000  | 0.000000058481037 |

<!--- | 0.000000000010000  | 0.000001168704061 | --->
<!--- | 0.000000000001000  | 0.000043240216924 | --->
<!--- | 0.000000000000100  | 0.000733915900314 | --->
<!--- | 0.000000000000010  | 0.003706976198187 | --->
<!--- | 0.000000000000001  | 0.014809206444439 | --->




~~~matlab
    xplot = []; yplot = []; h = 0.1; x = 1;
    fprim = cos(x);
    for k = 1:15
        D = (sin(x + h) - sin(x)) / h;
        e_T = abs(D - fprim);
        xplot = [xplot; h];
        yplot = [yplot; e_T];
        h = h / 10;
    end
    format long
    disp([xplot yplot])
    loglog(xplot, yplot)
~~~


![Absolutfelet $e_T$ vid framåtdifferens](img/fig2a.pdf){#fig:fig2a}


## Uppgift 2c--d

Här gör vi samma sak som i uppgift 2a--b, men nu med centraldifferens.

$$
e_T = \frac{f(x+h) - f(x-h)}{2h} - f'(x).
$$

Som framgår av tabell 2 och figur @fig:fig2c når vi nu det minsta felet
$1.1141 \cdot 10^{-11}$ redan vid $h = 10^{-5}$, ty nu har vi en andra
ordningens approximation, där felet är $\mathcal{O}(h^2)$.


: Absolutfelet $e_T$ vid centraldifferens

      $h$                $e_T$
-----------------   -----------------
0.100000000000000   0.000900053698380
0.010000000000000   0.000009004993406
0.001000000000000   0.000000090050450
0.000100000000000   0.000000000900430
0.000010000000000   0.000000000011141
0.000001000000000   0.000000000027717
0.000000100000000   0.000000000194328


<!--- 0.000000010000000   0.000000002581230 --->
<!--- 0.000000001000000   0.000000002969885 --->
<!--- 0.000000000100000   0.000000058481037 --->
<!--- 0.000000000010000   0.000001168704061 --->
<!--- 0.000000000001000   0.000012270934307 --->
<!--- 0.000000000000100   0.000178804388001 --->
<!--- 0.000000000000010   0.003706976198187 --->
<!--- 0.000000000000001   0.014809206444439 --->


![Absolutfelet $e_T$ vid centraldifferens](img/fig2c.pdf){#fig:fig2c}

~~~matlab
    xplot = []; yplot = []; h = 0.1; x = 1;
    fprim = cos(x);
    for k = 1:15
        D = (sin(x + h) - sin(x - h)) / (2 * h);
        e_T = abs(D - fprim);
        xplot = [xplot; h];
        yplot = [yplot; e_T];
        h = h / 10;
    end
    format long
    disp([xplot yplot])
    loglog(xplot, yplot)
~~~



\newpage

\newcommand\me{\ensuremath{\varepsilon_{\text{mach}}}}

Sauer analyserar formeln för centraldifferens för att beräkna felets
storleksordning teoretiskt. Låt $\hat{f}(x+h)$ vara flyttalsversionen av
$f(x+h)$. Differensen $\varepsilon$ mellan dessa har en storleksordning som
maskinepsilon $\me$. Vi får då att

$$
\begin{aligned}
f'(x)_{\text{korrekt}} - f'(x)_{\text{maskin}}
    & =
    f'(x) - \frac{\hat{f}(x+h) - \hat{f}(x-h)}{2h} \\
    & =
    f'(x) - \frac{f(x+h) + \varepsilon_1 - (f(x-h) + \varepsilon_2)}{2h} \\
    & =
    f'(x) - \frac{f(x+h) - f(x-h)}{2h} +
        \frac{\varepsilon_1 - \varepsilon_2}{2h}.
\end{aligned}
$$

Vi har vidare att

$$
\left|\frac{\varepsilon_2 - \varepsilon_1}{2h}\right| \leq
\frac{2\me}{2h} = \frac{\me}{h}.
$$

Vi kan nu beräkna absolutbeloppet av det totala approximationsfelet som
summan av det matematiska felet och avrundningsfelet, dvs.

$$
E(h) = \frac{h^2}{6}f'''(c) + \frac{\me}{h}, \quad x-h < c < x+h.
$$

Det minsta värdet av $E(h)$ ges av

$$
0 = E'(h) = \frac{h}{3}f'''(c) -\frac{\me}{h^2},
$$

som har lösningen $h = \sqrt[3]{\smash[b]{3\me/f'''(c)}} \approx
\sqrt[3]{\smash[b]{\me}}.$

I \textsc{matlab} är maskinfelet $\varepsilon_{\text{mach}} \approx 2.2204
\cdot 10^{-16}$, vilket ger $\sqrt[3]{\smash[b]{\me}} \approx 6.0555 \cdot
10^{-6}$, vilket ju är jämförbart med det värde på $h = 10^{-5}$ vi fick
fram i uppgiften.

Motsvarande formel för framåtdifferens blir på samma sätt

$$
\begin{aligned}
f'(x)_{\text{korrekt}} - f'(x)_{\text{maskin}}
    & =
    f'(x) - \frac{\hat{f}(x+h) - \hat{f}(x)}{2} \\
    & =
    f'(x) - \frac{f(x+h) - f(x)}{h} +
        \frac{\varepsilon_1 - \varepsilon_2}{h},
\end{aligned}
$$

$$
\left|\frac{\varepsilon_2 - \varepsilon_1}{h}\right| \leq
\frac{2}{h}\me,
$$

$$
E(h) = \frac{h}{2}f''(c) + \frac{2}{h}\me, \quad x < c < x+h.
$$

Minsta värdet av absolutfelet $E(h)$ ges nu av

$$
0 = E'(h) = \frac{1}{2}f''(c) - \frac{2}{h^2}\me,
$$

som har lösningen $h = \sqrt{\smash[b]{4\me/f''(c)}} \approx
2\sqrt{\smash[b]{\me}}$. I \textsc{matlab} blir detta ca $2.9802 \cdot
10^{-8}$, att jämföra med vårt beräknade värde $h = 10^{-8}$ i uppgift 2b.


\newpage



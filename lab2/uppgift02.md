Numerisk derivering och noggrannhetsordning
===

## Uppgift 2a--b

Vi skall approximera $f'(1)$, där $f(x) = \sin(x)$, med hjälp av
framåtdifferens. Formeln för denna är

$$
e_T = \frac{f(x+h) - f(x)}{h} - f'(x).
$$

Vi plottar felet med `loglog` i  <span
style='font-variant:small-caps;'>matlab</span>. Resultatet visas i figur
@fig:fig2a.

I tabell 1 ser vi hur $e_T$ förändras allt eftersom $h$ krymper. Vid $h =
10^{-8}$ har vi nått det minsta felet på $2.969885 \cdot 10^{-9}$,
därefter ökar $e_T$ igen pga. de avrundningsfel som uppstår. Detta syns
också i grafen.

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
| 0.000000000010000  | 0.000001168704061 |
| 0.000000000001000  | 0.000043240216924 |
| 0.000000000000100  | 0.000733915900314 |
| 0.000000000000010  | 0.003706976198187 |
| 0.000000000000001  | 0.014809206444439 |

![Absolutfelet $e_T$ vid framåtdifferens](fig2a.pdf){#fig:fig2a}

~~~matlab
    xplot = []; yplot = [];
    x = 1; h = 0.1; fprim = cos(x);
    for k = 1:15
        D = (sin(x + h) - sin(x)) / h;
        e_T = abs(D - fprim);
        xplot = [xplot; h];
        yplot = [yplot; e_T];
        h = h / 10;
    end
    loglog(xplot, yplot), grid
~~~


## Uppgift 2c--d

Här gör vi samma sak som i uppgift 2a--b, men nu med centraldifferens.

$$
e_T = \frac{f(x+h) - f(x-h)}{2h} - f'(x).
$$

Som framgår av tabell 2 och figur @fig:fig2c når vi nu det minsta felet
$1.1141 \cdot 10^{-11}$ redan vid $h = 10^{-5}$.

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
0.000000010000000   0.000000002581230
0.000000001000000   0.000000002969885
0.000000000100000   0.000000058481037
0.000000000010000   0.000001168704061
0.000000000001000   0.000012270934307
0.000000000000100   0.000178804388001
0.000000000000010   0.003706976198187
0.000000000000001   0.014809206444439

![Absolutfelet $e_T$ vid centraldifferens](fig2c.pdf){#fig:fig2c}


\newpage
~~~matlab
    xplot = []; yplot = [];
    h = 0.1; x = 1; fprim = cos(x);
    for k = 1:15
        D = (sin(x + h) - sin(x - h)) / (2 * h);
        e_T = abs(D - fprim);
        xplot = [xplot; h];
        yplot = [yplot; e_T];
        h = h / 10;
    end
    loglog(xplot, yplot), grid
~~~


3. Numerisk integration
===

## Uppgift 3a

Med de givna värdena blir den integral vi beräknar

$$
\pi\int\limits_0^{2.6}\Big(\frac{1-\arctan(x-1)/\pi}{2-\cos(\pi x)}\Big)^2dx.
$$


Som framgår av tabell 3 verkar vi med trapetsmetoden få tre säkra siffror,
medan Simpsons formel ger sju säkra siffror.

: Trapetsregeln och Simpsons metod

    $n$  $h$    $T(n)$            $S(n)$
   ---   ----   ---------------   ---------------
    26   0.10   3.0552013976186   3.0547865271792
    52   0.05   3.0548902447891   3.0547896574029
   104   0.025  3.0548148042494   3.0547898467502

   <!---  26   0.10   1.4632717781089   -- --->
   <!---  52   0.05   1.4634328043484   1.4634867581596 --->
   <!--- 104   0.025  1.4634732697068   1.4634867752451 --->


~~~matlab
    function f = fq(x)
        p = 1;
        f = pi * ((1 -  atan(p*(x - 1)) / pi) ./ (2 - cos(pi * x))).^2;

    L = 2.6;
    hv = []; nv = []; tv = []; sv = [];
    for h = [0.10 0.05 0.025]
        % trapetsregeln
        n = L / h;
        x = h * (0:n); f = fq(x);
        T = h * (sum(f) - f(1) / 2 - f(n+1) / 2);
        hv = [hv; h]; nv = [nv; n]; tv = [tv; T];
        % Simpsons formel
        h = h / 2; n = L / h;
        x = h * (0:n); f = fq(x);
        Tt = h * (sum(f) - f(1) / 2 - f(n+1) / 2);
        S = Tt + (Tt - T) / 3;
        sv = [sv; S];
    end
    disp([nv hv tv sv])
~~~



## Uppgift 3b

Först gjordes en referenslösning med Simpsons metod, där $n = 1000000$.
Med hjälp av denna räknades $E_h$ för trapetsregeln och Simpsons metod
ut när steglängden varierade mellan $0.13$ $(n = 20)$ och $0.0065$ $(n = 400)$.
Resultatet plottades med `loglog`, se figur @fig:fig3b. Enligt teorin har
trapetsregeln en noggrannhet på $\mathcal{O}(h^2)$, medan Simpsons formel har
$\mathcal{O}(h^4)$. Det tycks stämma med vad vi ser i figuren.

Noggrannhetsordningen för trapetsregeln enligt formeln
$$
\frac{I_h-I_{h/2}}{I_{h/2}-I_{h/4}}
$$
visas i tabell 4. Värdet håller sig nära 2. Då $h$ blir mycket
litet börjar avrundingsfelen bli märkbara.


\def\foo{\frac{I_h-I_{h/2}}{I_{h/2}-I_{h/4}}}

: Noggrannhetsordning

$h>10^{-6}$     $\log_2{\foo}$
--------       -----------------
0.01           2.000434580386679
0.01/2         2.000108558003395
0.01/4         2.000027258731387
0.01/8         2.000006162795650
0.01/16        2.000005051041455
0.01/32        2.000029867389179
0.01/64        1.999800602970571
0.01/128       1.999532798611837
0.01/256       2.007309863939329
0.01/512       1.952827295077155
0.01/1024      2.138028394617071
0.01/2048      3.350112323111495



![$E_h$ för trapetsregeln (övre) och Simpsons metod](img/fig3b.pdf){#fig:fig3b}



~~~matlab
    function f = fq(x)
        p = 1;
        f = pi * ((1 -  atan(p*(x - 1)) / pi) ./ (2 - cos(pi * x))).^2;

    L = 2.6;
    % referenslösning
    n = 1000000; h = L / n;
    % trapetsregeln
    x = h * (0:n); f = fq(x);
    T = h * (sum(f) - f(1) / 2 - f(n+1) / 2);
    % Simpsons formel
    n = 2*n; h = h/2;
    x = h * (0:n); f = fq(x);
    Tt = h * (sum(f) - f(1) / 2 - f(n+1) / 2);
    % referensvärde
    ref = Tt + (Tt - T) / 3;

    hv = []; Eht = []; Ehs = []; Tv = [];
    for n = (20:2:400)
        h = L / n;
        hv = [hv; h];
        % trapetsregeln
        x = h * (0:n); f = fq(x);
        T = h * (sum(f) - f(1) / 2 - f(n+1) / 2);
        e = abs(ref - T);
        Eht = [Eht; e];
        Tv = [Tv; T];
        % Simpsons formel
        n = 2*n; h = h/2;
        x = h * (0:n); f = fq(x);
        Tt = h * (sum(f) - f(1) / 2 - f(n+1) / 2);
        S = Tt + (Tt - T) / 3;
        e = abs(ref - S);
        Ehs = [Ehs; e];
    end
    loglog(hv, Eht, hv, Ehs), grid

    %
    % Noggrannhetsordning:
    %
    L = 2.6; I = []; h = 0.01; table = [];
    while h > 1e-6
        n = L / h;
        % trapetsregeln
        x = h * (0:n); f = fq(x);
        T = h * (sum(f) - f(1) / 2 - f(n+1) / 2);
        I = [I T];
        h = h/2;
    end
    for i = 1:length(I)-2
        val = (I(i) - I(i+1)) / (I(i+1) - I(i+2));
        table = [ table  log2(val) ];
    end
    disp(table')
~~~



## Uppgift 3c

Se tabell 5. Som synes ger Simpsons metod ett ca 20 ggr mindre fel då
$p=1$, medan `quad` ger ett 100 ggr mindre fel då $p=1000$.

\def\iref{I_{\text{ref}}}

: Jämförelse mellan Simpsons metod och `quad`

$p$        1                                  1000
-----      -------                            ------
$\iref$    3.054789859276017                  3.281110064242890
$I_q$      3.054789478205698                  3.281108706829632
$I_s$      3.054789839675422                  3.281270832923760
$e_q$      $3.810703192996812\cdot 10^{-7}$   $1.357413257796480\cdot 10^{-6}$
$e_s$      $1.960059536898484\cdot 10^{-8}$   $1.607686808697828\cdot 10^{-4}$



~~~matlab
    L = 2.6;
    ref = quad(@fq, 0, L, 1e-14)
    [I, fcnt] = quad(@fq, 0, L, 1e-6)
    n = fcnt; h = L / n;
    % trapetsregeln
    x = h * (0:n); f = fq(x);
    T = h * (sum(f) - f(1) / 2 - f(n+1) / 2);
    % Simpsons formel
    n = 2*n; h = h/2; x = h * (0:n); f = fq(x);
    Tt = h * (sum(f) - f(1) / 2 - f(n+1) / 2);
    S = Tt + (Tt - T) / 3
    eq = I - ref
    es = S - ref
~~~



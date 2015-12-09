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
    26   0.10   3.0552013976186   --
    52   0.05   3.0548902447891   3.0547896574029
   104   0.025  --                3.0547898467502

   <!---  26   0.10   1.4632717781089   -- --->
   <!---  52   0.05   1.4634328043484   1.4634867581596 --->
   <!--- 104   0.025  1.4634732697068   1.4634867752451 --->

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
visas i tabell 4. Värdet håller sig nära 4. Då $h$ blir mycket
litet börjar avrundingsfelen bli märkbara.

: Noggrannhetsordning

     $h > 10^{-6}$
   -----------------
   4.001205094174055
   4.000300998020331
   4.000075577965221
   4.000017086934212
   4.000014004485089
   4.000082810843593
   3.999447192248028
   3.998704852421342
   4.020318678307168
   3.871324643831464
   4.401601067378252

![$E_h$ för trapetsregeln (övre) och Simpsons metod](fig3b.pdf){#fig:fig3b}


## Uppgift 3c

Resultaten i denna uppgift visas i tabell 5. Som synes ger Simpsons metod
ett ca 20 ggr mindre fel då $p=1$, medan `quad` ger ett 100 ggr mindre fel
då $p=1000$.

: Jämförelse mellan Simpsons metod och `quad`

$p$        1                                  1000
-----      -------                            ------
$I_{ref}$  3.054789859276017                  3.281110064242890
$I_q$      3.054789478205698                  3.281108706829632
$I_s$      3.054789839675422                  3.281270832923760
$e_q$      $3.810703192996812\cdot 10^{-7}$   $1.357413257796480\cdot 10^{-6}$
$e_s$      $1.960059536898484\cdot 10^{-8}$   $1.607686808697828\cdot 10^{-4}$

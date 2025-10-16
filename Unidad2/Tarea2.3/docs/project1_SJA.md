# Proyecto 1: Distintas poblaciones modernas europeas comparten un mismo 3-way admixture?
**Autor:** Samuel Jorquera.

Para el presente proyecto, se utilizaron datos de las poblaciones
- GBR: Gran bretaña
- FIN.DG: Finlandia
- Hungarian.DG: Húngara
- TSI.DG: Italia

A nivel general, las poblaciones Europeas son consideradas genéticamente similares, de modo que estas poblaciones planteadas pertenecen a 4 zonas distintas de europa. Gran bretaña consistente al norte de europa, finlandia al noreste, una zona relevante para el flujo migratorio. Hungría como europa central al norte de los balcanes, y, finalmente, italya como una región peninsular del sur de europa.

Por otro lado, las fuentes de admixture será DNA antiguo de luxemburgo, Asia central (rusian_samara) y Turco (oriente medio - europa).

## f3outgroup:

El análisis f3 outgroup nos entrega lo siguiente:
```
   pop1     pop2         pop3                            est       se     z     p
   <chr>    <chr>        <chr>                         <dbl>    <dbl> <dbl> <dbl>
 1 Mbuti.DG FIN.DG       Luxembourg_Mesolithic.DG     0.0766 0.000576  133.     0
 2 Mbuti.DG FIN.DG       Russia_Samara_EBA_Yamnaya.AG 0.0735 0.000509  144.     0
 3 Mbuti.DG FIN.DG       Turkey_Marmara_Barcin_N.AG   0.0716 0.000502  143.     0
 4 Mbuti.DG GBR.DG       Luxembourg_Mesolithic.DG     0.0760 0.000569  133.     0
 5 Mbuti.DG GBR.DG       Russia_Samara_EBA_Yamnaya.AG 0.0734 0.000506  145.     0
 6 Mbuti.DG GBR.DG       Turkey_Marmara_Barcin_N.AG   0.0729 0.000499  146.     0
 7 Mbuti.DG Hungarian.DG Luxembourg_Mesolithic.DG     0.0750 0.000660  114.     0
 8 Mbuti.DG Hungarian.DG Russia_Samara_EBA_Yamnaya.AG 0.0727 0.000542  134.     0
 9 Mbuti.DG Hungarian.DG Turkey_Marmara_Barcin_N.AG   0.0724 0.000533  136.     0
10 Mbuti.DG TSI.DG       Luxembourg_Mesolithic.DG     0.0730 0.000554  132.     0
11 Mbuti.DG TSI.DG       Russia_Samara_EBA_Yamnaya.AG 0.0714 0.000501  142.     0
12 Mbuti.DG TSI.DG       Turkey_Marmara_Barcin_N.AG   0.0734 0.000495  148.     0
```
Se encuentra que para las poblaciones británicas, finlandesas y húngaras demuestran mayor cercanía con el DNA mesolítico de luxemburgo, luego con el ruso, y finalmente con el turco. Sin embargo, para la población italiana, el orden de cercanía es turco>luxemburgo>ruso. Esto nos sugiere que podrían diferir los flujos génicos, existiendo algún flujo de las regiones turcas a italiana que no ocurrieron en otras regiones europeas.

## f4
Pasando ahora al f4:
```
pop1                       pop2                     pop3     pop4       est      se      z        p
  <chr>                      <chr>                    <chr>    <chr>    <dbl>   <dbl>  <dbl>    <dbl>
1 Turkey_Marmara_Barcin_N.AG Luxembourg_Mesolithic.DG GBR.DG   Mbut… -3.08e-3 3.03e-4 -10.2  2.55e-24
2 Turkey_Marmara_Barcin_N.AG Luxembourg_Mesolithic.DG FIN.DG   Mbut… -4.94e-3 3.09e-4 -16.0  1.44e-57
3 Turkey_Marmara_Barcin_N.AG Luxembourg_Mesolithic.DG Hungari… Mbut… -2.59e-3 4.39e-4  -5.89 3.80e- 9
4 Turkey_Marmara_Barcin_N.AG Luxembourg_Mesolithic.DG TSI.DG   Mbut…  4.29e-4 2.93e-4   1.47 1.43e- 1
```

Acá se reiteran los resultados anteriores, en los que claramente GBR, húngaro y finlandés presentan un D significativamente menor a 0, lo que indica mayor cercanía de estas poblaciones con pop2 (luxemburgo) que con la turca ancestral. Para la población itálica, no se observa que D sea significativamente distinta de 0, por lo que no se puede aseverar que haya un mestizaje, y los DNA de luxemburgo y turcos presentan la misma cercanía con el DNA moderno de italia.

## qpWay y qpAdm de población GBR y TSI
Finalmente, a modo de comparación, se realizará qpWay y qpAdm en ```GBR.DG``` e ```TSI.DG```. Esto pues pertenecen a zonas geográficamente distantes.

Para GBR, el ```rankdrop``` indica lo siguiente:

```
f4rank   dof   chisq        p dofdiff chisqdiff  p_nested
   <int> <int>   <dbl>    <dbl>   <int>     <dbl>     <dbl>
1      2     2   0.573 7.51e- 1       4      39.0  6.88e- 8
2      1     6  39.6   5.46e- 7       6     287.   3.96e-59
3      0    12 327.    9.57e-63      NA      NA   NA       
```

Lo que indica que con 2 o menos eventos de flujo génico de las fuentes se puede expicar la población a nivel ancestral. Para TSI:
```
 f4rank   dof   chisq        p dofdiff chisqdiff  p_nested
   <int> <int>   <dbl>    <dbl>   <int>     <dbl>     <dbl>
1      2     2   0.520 7.71e- 1       4      72.5  6.84e-15
2      1     6  73.0   9.97e-14       6     207.   4.93e-42
3      0    12 280.    5.96e-53      NA      NA   NA 
```

Se observa interesantemente que, en contraste, 2 eventos de flujo génico no son suficientes para explicar a la población, por lo que se requieren 3 o más.

Luego, realizando 3-way qpAdm se tiene para GBR:
```
target left                         weight     se     z
  <chr>  <chr>                         <dbl>  <dbl> <dbl>
1 GBR.DG Turkey_Marmara_Barcin_N.AG    0.295 0.0558  5.30
2 GBR.DG Russia_Samara_EBA_Yamnaya.AG  0.810 0.0938  8.64
3 GBR.DG Luxembourg_Mesolithic.DG     -0.106 0.0805 -1.31
```
Y finalmente se obtiene que el modelo no es factible debido a que existe una proporción negativa. Observando los análisis con drop de poblaciones en ```popdrop```:

```
 pat      wt   dof   chisq        p f4rank Turkey_Marmara_Barcin_N.AG Russia_Samara_EBA_Yamna…¹ Luxembourg_Mesolithi…² feasible best 
  <chr> <dbl> <dbl>   <dbl>    <dbl>  <dbl>                      <dbl>                     <dbl>                  <dbl> <lgl>    <lgl>
1 000       0     2   0.573 7.51e- 1      2                      0.295                     0.810                 -0.106 FALSE    NA   
2 001       1     3   3.29  3.49e- 1      1                      0.284                     0.716                 NA     TRUE     TRUE 
3 010       1     3  36.3   6.54e- 8      1                      0.242                    NA                      0.758 TRUE     TRUE 
4 100       1     3  15.1   1.73e- 3      1                     NA                         1.54                  -0.540 FALSE    TRUE 
5 011       2     4 261.    2.29e-55      0                      1                        NA                     NA     TRUE     NA   
6 101       2     4  25.2   4.63e- 5      0                     NA                         1                     NA     TRUE     NA   
7 110       2     4  39.6   5.22e- 8      0                     NA                        NA                      1     TRUE     NA   
# ℹ abbreviated names: ¹​Russia_Samara_EBA_Yamnaya.AG, ²​Luxembourg_Mesolithic.DG
# ℹ 3 more variables: dofdiff <dbl>, chisqdiff <dbl>, p_nested <dbl>
```

Se extrae que el mejor modelo de 2 poblaciones es aquel sin la población rusa. Por lo que en este contexto, el modelo que mejor explica un 3-way admixture es un flujo génico que incluye población mesolítica turca (0.242) y luxemburguesa (0.758).

Para TSI:
```
target left                         weight     se     z
  <chr>  <chr>                         <dbl>  <dbl> <dbl>
1 TSI.DG Turkey_Marmara_Barcin_N.AG    0.620 0.0580 10.7 
2 TSI.DG Russia_Samara_EBA_Yamnaya.AG  0.648 0.103   6.27
3 TSI.DG Luxembourg_Mesolithic.DG     -0.268 0.0892 -3.00
```

Nuevamente, se observa que el modelo no es factible, debido a la presencia de valores negativos. Viendo ```popdrop```

```
 pat      wt   dof   chisq        p f4rank Turkey_Marmara_Barcin_N.AG Russia_Samara_EBA_Yamna…¹ Luxembourg_Mesolithi…² feasible best 
  <chr> <dbl> <dbl>   <dbl>    <dbl>  <dbl>                      <dbl>                     <dbl>                  <dbl> <lgl>    <lgl>
1 000       0     2   0.520 7.71e- 1      2                      0.620                     0.648                 -0.268 FALSE    NA   
2 001       1     3  30.5   1.06e- 6      1                      0.588                     0.412                 NA     TRUE     TRUE 
3 010       1     3  59.9   6.05e-13      1                      0.486                    NA                      0.514 TRUE     TRUE 
4 100       1     3  19.4   2.29e- 4      1                     NA                         3.47                  -2.47  FALSE    TRUE 
5 011       2     4 126.    2.33e-26      0                      1                        NA                     NA     TRUE     NA   
6 101       2     4 108.    2.01e-22      0                     NA                         1                     NA     TRUE     NA   
7 110       2     4  67.4   7.89e-14      0                     NA                        NA                      1     TRUE     NA   
# ℹ abbreviated names: ¹​Russia_Samara_EBA_Yamnaya.AG, ²​Luxembourg_Mesolithic.DG
# ℹ 3 more variables: dofdiff <dbl>, chisqdiff <dbl>, p_nested <dbl>
```

Se observa algo similar que lo mostrado en población GBR. Sin embargo, es importante notar que las proporciones de las poblaciones son altamente distintas con DNA turco siendo un 0.486 y luxemburgués un 0.514, notablemente menor al 0.758 mostrado en la población GBR.

## Conclusiones

Así, se concluye que poblaciones modernas de europa no presentan necesariamente el mismo 3-way admixture (en este caso, 2-way admixture), y que claramente presentan flujos génicos que difieren altamente entre diversas zonas geográficas.

Aún cuando la población europea presenta cierto nivel de homogeneidad genética, hay que notar que aún se presentan diferencias de ancestría y patrones de mestizaje diversos.


# Project 4:  Medieval / Iberian admixture

**Autor:** Samuel Jorquera

En este proyecto se evalúan los posible flujos génicos en DNA ancestral de españa/península ibérica. Se usa como DNA objetivo material desde distintas épocas, particularmente se tienen 5 muestras pertenecientes a momentos en los que dominaba el islam, por lo que son 5 muestras independientes, de similar zona geográfica. En los análisis se tomarán como réplicas

Por otro lado, como fuentes se tienen 3 muestras de DNA de gran antiguedad. Siendo una de ellas perteneciente a la misma península ibérica, una a marruecos, al norte de áfrica, y finalmente una de presunta etnia Yoruba, ubicada en la africa sub-sahariana occidental (en las actuales nigeria, benín y togo).

El objetivo de este proyecto es conocer las posibles procedencias y los flujos génicos compartidos de DNA ancestral español. Además, se busca establecer la influencia de regiones históricamente dominadas por el islam, como puede ser el actual territorio de marruecos.

## f3 Outgroup
```
pop1               pop2                         pop3                 est       se     z     p
   <chr>              <chr>                        <chr>              <dbl>    <dbl> <dbl> <dbl>
 1 Ethiopia_4500BP.SG Spain_Islamic.AG             Morocco_EN.WGC.SG 0.0983 0.000757  130.     0
 2 Ethiopia_4500BP.SG Spain_Islamic.AG             Spain_MLN.AG      0.116  0.000697  167.     0
 3 Ethiopia_4500BP.SG Spain_Islamic.AG             Yoruba.DG         0.0764 0.000512  149.     0
 4 Ethiopia_4500BP.SG Spain_Islamic_Zira.AG        Morocco_EN.WGC.SG 0.0977 0.000795  123.     0
 5 Ethiopia_4500BP.SG Spain_Islamic_Zira.AG        Spain_MLN.AG      0.115  0.000726  158.     0
 6 Ethiopia_4500BP.SG Spain_Islamic_Zira.AG        Yoruba.DG         0.0761 0.000529  144.     0
 7 Ethiopia_4500BP.SG Spain_Medieval.AG            Morocco_EN.WGC.SG 0.0975 0.000759  128.     0
 8 Ethiopia_4500BP.SG Spain_Medieval.AG            Spain_MLN.AG      0.118  0.000722  163.     0
 9 Ethiopia_4500BP.SG Spain_Medieval.AG            Yoruba.DG         0.0761 0.000532  143.     0
10 Ethiopia_4500BP.SG Spain_NazariPeriod_Muslim.AG Morocco_EN.WGC.SG 0.0973 0.000750  130.     0
11 Ethiopia_4500BP.SG Spain_NazariPeriod_Muslim.AG Spain_MLN.AG      0.115  0.000715  161.     0
12 Ethiopia_4500BP.SG Spain_NazariPeriod_Muslim.AG Yoruba.DG         0.0763 0.000518  147.     0
13 Ethiopia_4500BP.SG Spain_Visigoth_Granada.AG    Morocco_EN.WGC.SG 0.0982 0.000751  131.     0
14 Ethiopia_4500BP.SG Spain_Visigoth_Granada.AG    Spain_MLN.AG      0.116  0.000692  168.     0
15 Ethiopia_4500BP.SG Spain_Visigoth_Granada.AG    Yoruba.DG         0.0763 0.000503  152.     0
```

El análisis f3 outgroup nos demuestra que las muestras presentan un mayor flujo génico compartido con el DNA ancestral de españa, luego con el marroquí, y finalmente con la región Yoruba. De acá se puede extraer que, efectivamente, puede haber flujo génico, sin embargo, la población habitante de la península ibérica ha permanecido durante milenios en dicha zona geográfica.

## f4

En este punto, es más interesante notar las semejanzas entre las muestras españolas con las muestras marroquíes, de modo que a partir de este punto se dejará de considerar el DNA yoruba.

El f4 entrega los siguientes resultados:

```
pop1              pop2         pop3                         pop4          est      se     z        p
  <chr>             <chr>        <chr>                        <chr>       <dbl>   <dbl> <dbl>    <dbl>
1 Morocco_EN.WGC.SG Spain_MLN.AG Spain_Islamic.AG             Papuan.… -0.00730 4.30e-4 -17.0 8.38e-65
2 Morocco_EN.WGC.SG Spain_MLN.AG Spain_Medieval.AG            Papuan.… -0.00926 4.63e-4 -20.0 4.07e-89
3 Morocco_EN.WGC.SG Spain_MLN.AG Spain_NazariPeriod_Muslim.AG Papuan.… -0.00697 4.36e-4 -16.0 1.94e-57
4 Morocco_EN.WGC.SG Spain_MLN.AG Spain_Islamic_Zira.AG        Papuan.… -0.00643 4.81e-4 -13.4 7.27e-41
5 Morocco_EN.WGC.SG Spain_MLN.AG Spain_Visigoth_Granada.AG    Papuan.… -0.00702 4.36e-4 -16.1 1.91e-58
```

Así, nuevamente se encuentra una mayor cercanía de la población españa de la época medieval/islámica, con el DNA ancestral de la península ibérica. Esto induce que, a pesar de la dominancia del islam en esta región, hubo un mestizaje de la población, de modo que aún se mantenía bastante del DNA original de la península ibérica.

## qpWay

Por último, se efectúa qpWay considerando únicamente las poblaciones de marruecos y de la península ibérica, entregando los siguientes ```rankdrop```:

```
Spain_Islamic.AG
# A tibble: 2 × 7
  f4rank   dof  chisq         p dofdiff chisqdiff   p_nested
   <int> <int>  <dbl>     <dbl>   <int>     <dbl>      <dbl>
1      1     3   5.77 1.23e-  1       5      677.  5.91e-144
2      0     8 682.   4.68e-142      NA       NA  NA  

Spain_Medieval.AG
f4rank   dof chisq         p dofdiff chisqdiff   p_nested
   <int> <int> <dbl>     <dbl>   <int>     <dbl>      <dbl>
1      1     3  15.3 1.55e-  3       5      696.  3.61e-148
2      0     8 711.  2.60e-148      NA       NA  NA        

Spain_NazariPeriod_Muslim.AG
 f4rank   dof chisq         p dofdiff chisqdiff   p_nested
   <int> <int> <dbl>     <dbl>   <int>     <dbl>      <dbl>
1      1     3  12.9 4.89e-  3       5      701.  3.44e-149
2      0     8 714.  8.44e-149      NA       NA  NA  

Spain_Islamic_Zira.AG
f4rank   dof chisq         p dofdiff chisqdiff   p_nested
   <int> <int> <dbl>     <dbl>   <int>     <dbl>      <dbl>
1      1     3  16.1 1.10e-  3       5      669.  2.17e-142
2      0     8 685.  1.03e-142      NA       NA  NA        

Spain_Visigoth_Granada.AG
f4rank   dof  chisq         p dofdiff chisqdiff   p_nested
   <int> <int>  <dbl>     <dbl>   <int>     <dbl>      <dbl>
1      1     3   6.72 8.13e-  2       5      672.  5.54e-143
2      0     8 679.   2.71e-141      NA       NA  NA        
```

Así, se encuentra que en todos los casos, 1 flujo génico desde las fuentes no es capaz de explicar totalmente a las poblaciones. Exceptuando a la muestra ```Spain_Islamic.AG```, tampoco 2 son suficientes. Por lo tanto, se puede concluir que existe un flujo génico desde la población marroquí.

Finalmente, se usará qpAdm para estudiar qué proporción del DNA puede explicar a la población islámica de la época medieval española.

## qpAdm

```
Spain_Islamic.AG
target           left              weight     se     z
  <chr>            <chr>              <dbl>  <dbl> <dbl>
1 Spain_Islamic.AG Spain_MLN.AG      0.953  0.0181 52.6 
2 Spain_Islamic.AG Morocco_EN.WGC.SG 0.0467 0.0181  2.58 

Spain_Medieval.AG
target            left               weight     se      z
  <chr>             <chr>               <dbl>  <dbl>  <dbl>
1 Spain_Medieval.AG Spain_MLN.AG       1.02   0.0227 44.9  
2 Spain_Medieval.AG Morocco_EN.WGC.SG -0.0193 0.0227 -0.849

Spain_NazariPeriod_Muslim.AG
target                       left              weight     se     z
  <chr>                        <chr>              <dbl>  <dbl> <dbl>
1 Spain_NazariPeriod_Muslim.AG Spain_MLN.AG       0.850 0.0232 36.6 
2 Spain_NazariPeriod_Muslim.AG Morocco_EN.WGC.SG  0.150 0.0232  6.47

Spain_Islamic_Zira.AG
target                left              weight     se     z
  <chr>                 <chr>              <dbl>  <dbl> <dbl>
1 Spain_Islamic_Zira.AG Spain_MLN.AG       0.880 0.0262 33.5 
2 Spain_Islamic_Zira.AG Morocco_EN.WGC.SG  0.120 0.0262  4.58      

Spain_Visigoth_Granada.AG
 target                    left              weight     se     z
  <chr>                     <chr>              <dbl>  <dbl> <dbl>
1 Spain_Visigoth_Granada.AG Spain_MLN.AG       0.866 0.0200 43.3 
2 Spain_Visigoth_Granada.AG Morocco_EN.WGC.SG  0.134 0.0200  6.72      
```

Por último, las 2 primeras muestras (```Islamic``` y ```Medieval```) deben ser descartadas. En primer lugar, ```Medieval``` es infactible, al tener un peso <1. Por otro lado, en ```Islamic```, el DNA marroquí tiene un peso cuyo valor |z| < 3, por lo que no es confiable.

Las 3 muestras restantes tienen una proporción similar, que fluctúa entre 0.85 y 0.88 de peso del DNA de la península ibérica.

## Conclusiones
Desde 3 poblaciones independientes, se encuentra que el DNA ancestral proveniente de la época medieval de la península ibérica (marcada por un dominio del islam), ha permanecido conservado desde la misma península ibérica. Y que, a pesar de los flujos migratorios causados por eventos históricos, DNAs ancestrales de regiones como marruecos sólo explican un pequeño porcentaje del DNA en la época medieval.






















# Proyecto 2: Steppe formation model

**Autor:** Samuel Jorquera

El presente proyecto consiste en estudiar DNA ancestral de la región caucásica y de asia central. Particularmente, se estudian las siguientes poblaciines:
- ```Russia_MLBA_Sintashta.AG```: Perteneciente a la cultura sintashta (ubicada en la actual rusia) obtenido desde una región al norte de kazajistán.
- ```Kazakhstan_Maitan_MLBA_Alakul.AG```: DNA de kazajistán (Asia central) al noreste del mar caspio.
- ```Russia_LBA_Srubnaya_Alakul.SG```: Perceneciente a la cultura srubnaya (ubicada en la actual Rusia) en la región caucásica –al norte del mar negro y de países como Armenia, georgia o de la república chechena, y cuyo territorio abarcaba también a ucrania y kazjistán

Así, se tienen 3 muestras de DNA ancestral desde una región específica entre Asia central y europa del este, al norte tanto del mar caspio como del mar negro.

Se va a contrastar el flujo génico de estas poblaciones en comparación a 2 fuentes:
- ```Iran_GanjDareh_N.AG ```: DNA antiguo del neolítico, ubicado en el Ganj Dareh Iraní, al sur del mar caspio – Es decir, medio oriente. Nos referiremos a él como DNA iraní
- ```Russia_Sidelkino_HG.SG```: DNA antiguo ubicado más cerca del cáucaso, hacia el norte de rusia. Nos referiremos a él como DNA ruso HG

Por lo tanto, en este proyecto se busca conocer la deriva génica, y la influencia que tienen estas 2 fuentes de DNA en la región del cáucaso y asia central. Ambas regiones geográficas presentan cercanía con las poblaciones de estudio.

## f3outgroup

```
 pop1     pop2                             pop3                      est       se     z     p
  <chr>    <chr>                            <chr>                   <dbl>    <dbl> <dbl> <dbl>
1 Mbuti.DG Kazakhstan_Maitan_MLBA_Alakul.AG Iran_GanjDareh_N.AG    0.0679 0.000516  132.     0
2 Mbuti.DG Kazakhstan_Maitan_MLBA_Alakul.AG Russia_Sidelkino_HG.SG 0.0747 0.000597  125.     0
3 Mbuti.DG Russia_LBA_Srubnaya_Alakul.SG    Iran_GanjDareh_N.AG    0.0674 0.000521  129.     0
4 Mbuti.DG Russia_LBA_Srubnaya_Alakul.SG    Russia_Sidelkino_HG.SG 0.0757 0.000591  128.     0
5 Mbuti.DG Russia_MLBA_Sintashta.AG         Iran_GanjDareh_N.AG    0.0677 0.000502  135.     0
6 Mbuti.DG Russia_MLBA_Sintashta.AG         Russia_Sidelkino_HG.SG 0.0749 0.000579  129.     0
```

El Outgroup-f3 nos indica que para todas las poblaciones en estudio hay una mayor cercanía al DNA ruso HG que al iraní.

## f4

```
  pop1                pop2                   pop3                             pop4         est      se     z         p
  <chr>               <chr>                  <chr>                            <chr>      <dbl>   <dbl> <dbl>     <dbl>
1 Iran_GanjDareh_N.AG Russia_Sidelkino_HG.SG Russia_MLBA_Sintashta.AG         Mbuti.… -0.00718 3.69e-4 -19.5 1.89e- 84
2 Iran_GanjDareh_N.AG Russia_Sidelkino_HG.SG Kazakhstan_Maitan_MLBA_Alakul.AG Mbuti.… -0.00684 4.05e-4 -16.9 4.98e- 64
3 Iran_GanjDareh_N.AG Russia_Sidelkino_HG.SG Russia_LBA_Srubnaya_Alakul.SG    Mbuti.… -0.00832 3.87e-4 -21.5 1.26e-102
```
Encontramos nuevamente que para todas las poblaciones, hay mayor cercanía con la población rusa hg, pues D es significativamente menor que 0, lo que refuerza los resultados obtenidos en el f3 outgroup.

## qpWay y qpAdm

el qpWay nos indica el siguiente ```rankdrop```:

```
Russia_MLBA_Sintashta.AG:
f4rank   dof  chisq        p dofdiff chisqdiff  p_nested
   <int> <int>  <dbl>    <dbl>   <int>     <dbl>     <dbl>
1      1     3   1.57 6.67e- 1       5      127.  9.98e-26
2      0     8 129.   5.43e-24      NA       NA  NA       


Kazakhstan_Maitan_MLBA_Alakul.AG: 
  f4rank   dof  chisq        p dofdiff chisqdiff  p_nested
   <int> <int>  <dbl>    <dbl>   <int>     <dbl>     <dbl>
1      1     3   2.48 4.79e- 1       5      113.  8.64e-23
2      0     8 116.   2.58e-21      NA       NA  NA  


Russia_LBA_Srubnaya_Alakul.SG:
  f4rank   dof  chisq        p dofdiff chisqdiff  p_nested
   <int> <int>  <dbl>    <dbl>   <int>     <dbl>     <dbl>
1      1     3   1.87 5.99e- 1       5      142.  6.21e-29
2      0     8 144.   3.43e-27      NA       NA  NA
```

Por lo que se desmuestra que no hacen falta 2 flujo génicos para explicar el DNA de ninguna de las muestras. Por lo que una vez más, la alternativa de flujo génico desde el DNA ancestral iraní se vuelve distante.

Finalmente el qpAdm:

```
target                   left                   weight     se     z
  <chr>                    <chr>                   <dbl>  <dbl> <dbl>
1 Russia_MLBA_Sintashta.AG Iran_GanjDareh_N.AG     0.307 0.0672  4.56
2 Russia_MLBA_Sintashta.AG Russia_Sidelkino_HG.SG  0.693 0.0672 10.3 


target                           left                   weight     se     z
  <chr>                            <chr>                   <dbl>  <dbl> <dbl>
1 Kazakhstan_Maitan_MLBA_Alakul.AG Iran_GanjDareh_N.AG     0.358 0.0705  5.08
2 Kazakhstan_Maitan_MLBA_Alakul.AG Russia_Sidelkino_HG.SG  0.642 0.0705  9.10


target                           left                   weight     se     z
  <chr>                            <chr>                   <dbl>  <dbl> <dbl>
1 Kazakhstan_Maitan_MLBA_Alakul.AG Iran_GanjDareh_N.AG     0.358 0.0705  5.08
2 Kazakhstan_Maitan_MLBA_Alakul.AG Russia_Sidelkino_HG.SG  0.642 0.0705  9.10
```

Mostrando una vez más que hay una evidencia clara de que si hay un mestizaje proveniente de estas zonas, el DNA ruso HG es mucho más probable de ser el candidato.

## Conclusiones
Todos los análisis apuntan a una mayor cercanía del DNA ruso HG con las muestras de DNA objetivo. Se encuentra que no hay diferencias entre estas poblaciones de DNA antiguo, por lo que ante un escenario de mestizaje, el de mayor posiblidad es el ruso HG. El qpWay nos da a entender que el DNA ruso HG es suficiente para explicar el DNA de las muestras, y que el DNA iraní no aporta mucha información nueva, de modo que es poco probable un mestizaje desde esta zona, aún cuando estén geográficamente cercanas.












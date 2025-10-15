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

Finalmente, a modo de comparación, se realizará qpWay y qpAdm en ```GBR.DG``` e ```ITS``. Esto pues pertenecen a zonas geográficamente distantes.

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
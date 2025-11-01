# Proyecto 1: Distintas poblaciones modernas europeas comparten un mismo 3-way admixture?
**Autor:** Samuel Jorquera.

En el presente proyecto, se estudiará el poblamiento de américa. Es generalmente acordado que el poblamiento de américa podría haber provenido desde flujos migratorios desde el estrecho de bering. Acá, contrastaremos dicha hipótesis contra un flujo migratorio proveniente de China y europa.

Para ello, se contará con los siguientes grupos:
- ```Italy_Epigravettian.AG```: Italiano de ~11000 BP
- ```France_Mesolithic.AG```: Francés de ~11000 BP
- ```China_AmurRiver_LPaleolithic.AG```: Chino de ~12500 BP
- ```USA_Anzick_realigned.SG```: Norteamérica, cerca del estrecho de bering, de ~11000BP
- ```USA_Ancient_Beringian.SG```: Norteamérica, cerca del estrecho de bering, de ~11000BP
- ```Russia_EastSiberia_UstKyakhta_UP.AG.SG```: Siberiano de ~13000BP.

Se estudiarán diversas poblaciones de américa. En particular, nos enfocaremos en poblaciones ancestrales:

- ```Belize_4900BP.AG```: Población de Belize de ~4000BP
- ```Brazil_MG_C_Sumidouro_EH_HG_10100BP.SG```: Acentral de brazil de 10300BP
- ```Peru_Lauricocha_8600BP.AG```: Peruano de ~8600BP

## f3 Outgroup

El f3-Outgroup nos entrega el siguiente resultado:
```
pop1     pop2                                   pop3                        est      se     z     p
   <chr>    <chr>                                  <chr>                     <dbl>   <dbl> <dbl> <dbl>
 1 Mbuti.DG Belize_4900BP.AG                       China_AmurRiver_LPaleol… 0.0775 6.87e-4 113.      0
 2 Mbuti.DG Belize_4900BP.AG                       France_Mesolithic.AG     0.0664 6.58e-4 101.      0
 3 Mbuti.DG Belize_4900BP.AG                       Italy_Epigravettian.AG   0.0663 6.22e-4 107.      0
 4 Mbuti.DG Belize_4900BP.AG                       Russia_EastSiberia_UstK… 0.0799 7.29e-4 110.      0
 5 Mbuti.DG Belize_4900BP.AG                       USA_Ancient_Beringian.SG 0.0856 7.20e-4 119.      0
 6 Mbuti.DG Belize_4900BP.AG                       USA_Anzick_realigned.SG  0.0964 8.18e-4 118.      0
 7 Mbuti.DG Brazil_MG_C_Sumidouro_EH_HG_10100BP.SG China_AmurRiver_LPaleol… 0.0760 7.20e-4 106.      0
 8 Mbuti.DG Brazil_MG_C_Sumidouro_EH_HG_10100BP.SG France_Mesolithic.AG     0.0671 6.77e-4  99.1     0
 9 Mbuti.DG Brazil_MG_C_Sumidouro_EH_HG_10100BP.SG Italy_Epigravettian.AG   0.0666 6.50e-4 103.      0
10 Mbuti.DG Brazil_MG_C_Sumidouro_EH_HG_10100BP.SG Russia_EastSiberia_UstK… 0.0795 7.75e-4 103.      0
11 Mbuti.DG Brazil_MG_C_Sumidouro_EH_HG_10100BP.SG USA_Ancient_Beringian.SG 0.0841 7.86e-4 107.      0
12 Mbuti.DG Brazil_MG_C_Sumidouro_EH_HG_10100BP.SG USA_Anzick_realigned.SG  0.0953 8.73e-4 109.      0
13 Mbuti.DG Peru_Lauricocha_8600BP.AG              China_AmurRiver_LPaleol… 0.0773 7.16e-4 108.      0
14 Mbuti.DG Peru_Lauricocha_8600BP.AG              France_Mesolithic.AG     0.0663 6.82e-4  97.2     0
15 Mbuti.DG Peru_Lauricocha_8600BP.AG              Italy_Epigravettian.AG   0.0663 6.59e-4 101.      0
16 Mbuti.DG Peru_Lauricocha_8600BP.AG              Russia_EastSiberia_UstK… 0.0799 7.60e-4 105.      0
17 Mbuti.DG Peru_Lauricocha_8600BP.AG              USA_Ancient_Beringian.SG 0.0859 7.91e-4 109.      0
18 Mbuti.DG Peru_Lauricocha_8600BP.AG              USA_Anzick_realigned.SG  0.0954 9.03e-4 106.      0
```

Se encuentra que las 2 muestras de DNA de norteamérica corresponden a la de mayor cercanía con los DNA objetivo. Les sigue el DNA siberiano, luego el Chino, y, finalmente, en menor medida, los Europeos. Así, se permite descartar, a priori, un flujo génico desde Europa.

Adicionalmente, se sospecha que las muestras de DNA de norteamérica pueden provenir desde flujos migratorios desde siberia, por lo tanto, la cercanía des estas muestras es:
```
pop1     pop2                     pop3                                      est       se     z     p
  <chr>    <chr>                    <chr>                                   <dbl>    <dbl> <dbl> <dbl>
1 Mbuti.DG USA_Ancient_Beringian.SG France_Mesolithic.AG                   0.0652 0.000703  92.7     0
2 Mbuti.DG USA_Ancient_Beringian.SG Russia_EastSiberia_UstKyakhta_UP.AG.SG 0.0787 0.000781 101.      0
3 Mbuti.DG USA_Anzick_realigned.SG  France_Mesolithic.AG                   0.0655 0.000731  89.5     0
4 Mbuti.DG USA_Anzick_realigned.SG  Russia_EastSiberia_UstKyakhta_UP.AG.SG 0.0797 0.000829  96.2     0
```
Donde, evidentemente, el flujo es más cercano desde siberia que desde europa.

## f4
Haciendo un primer f4, se puede observar claramente que el DNA proveniente de norteamérica presenta más cercanía (D<<0) que el de europa (usando 2 ejemplos):

```
pop1                 pop2                     pop3             pop4      est      se     z         p
  <chr>                <chr>                    <chr>            <chr>   <dbl>   <dbl> <dbl>     <dbl>
1 France_Mesolithic.AG USA_Ancient_Beringian.SG Belize_4900BP.AG Mbut… -0.0191 6.58e-4 -29.1 7.19e-186
2 France_Mesolithic.AG USA_Ancient_Beringian.SG Brazil_MG_C_Sum… Mbut… -0.0171 7.08e-4 -24.1 2.23e-128
3 France_Mesolithic.AG USA_Ancient_Beringian.SG Peru_Lauricocha… Mbut… -0.0196 7.04e-4 -27.8 1.09e-170
```

Sin embargo, es interesante estudiar la posibilidad de flujo génico desde China, en contraste a lo comúnmente conocido, que corresponde a migración de población desde siberia, mediante el estrecho de bering:

```
pop1                            pop2                      pop3  pop4       est      se     z       p
  <chr>                           <chr>                     <chr> <chr>    <dbl>   <dbl> <dbl>   <dbl>
1 China_AmurRiver_LPaleolithic.AG Russia_EastSiberia_UstKy… Beli… Mbut… -0.00230 5.69e-4 -4.05 5.12e-5
2 China_AmurRiver_LPaleolithic.AG Russia_EastSiberia_UstKy… Braz… Mbut… -0.00346 6.12e-4 -5.65 1.59e-8
3 China_AmurRiver_LPaleolithic.AG Russia_EastSiberia_UstKy… Peru… Mbut… -0.00265 6.07e-4 -4.36 1.28e-5
```
En este caso, se encuentra una clara mayor cercanía entre siberia con el DNA objetivo. Sin embargo, esto es con D bastante menor comparado al anterior. Podemos contrastar haciendo el mismo análisis, es decir, usando europa vs siberia como fuentes:

```
pop1                 pop2                                 pop3  pop4      est      se     z        p
  <chr>                <chr>                                <chr> <chr>   <dbl>   <dbl> <dbl>    <dbl>
1 France_Mesolithic.AG Russia_EastSiberia_UstKyakhta_UP.AG… Beli… Mbut… -0.0134 6.38e-4 -21.1 2.13e-98
2 France_Mesolithic.AG Russia_EastSiberia_UstKyakhta_UP.AG… Braz… Mbut… -0.0124 6.88e-4 -18.0 2.12e-72
3 France_Mesolithic.AG Russia_EastSiberia_UstKyakhta_UP.AG… Peru… Mbut… -0.0136 6.72e-4 -20.3 3.15e-91
```

En este caso, se encuentra un |D| bastante mayor en comparación al análisis anterior. Esto sugiere, principalmente, que no existió un flujo génico desde Europa hacia américa. Por otro lado, los valores D siguen siendo absolutamente menores para la población siberiana que a la norteamericana. Lo que sugiere que, aún existiendo flujo desde siberia al norte de américa, diversos eventos han hecho que hayan diferencias notables entre ambas poblaciones. Finalmente, los valores obtenidos desde china, indican que pudo haber un flujo migratorio desde dicha región hacia zonas cercanas a siberia, que luegos atravesaron el estrecho de bering. Es posible que hayan ocurrido varios flujos migratorios durante los periodos en los que se pudo atravesar dicho estrecho, lo que aumenta la variabilidad genética, y explica las diferencias entre DNA de siberia y del norte de américa.

## qpWave y qpAdm

Por último, se aplica qpWay








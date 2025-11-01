# Tarea 02 - Unidad 03
**Autor**: Samuel Jorquera Acevedo

Estudio en cBioPortal

## Selección de estudio

Nos centraremos en Adenocarcinoma gástrico. En particular, es un tipo de malignancia asociado con la infección crónica de *Helicobacter pylori*, por lo que es de interés estudiar la susceptibilidad génica más allá de las mutaciones comúnmente estudiadas.

- Nombre del estudio: "Stomach Adenocarcinoma (Pfizer and UHK, Nat Genet 2014)"
- Número total de pacientes: 100 pacientes.
- Institución responsable: University of Hong Kong y Pfizer.

En particular, se escoge este estudio pues presenta 46 pacientes con infección de *H. pylori*. Estos datos provienen de [una publicación en *Nature Genetics*](https://www.nature.com/articles/ng.2983).

Summary:

[](../img/Summary.png)

Clinical data:

[](../img/Clinical_data.png)

## Análisis genómico
Si observamos los genes con mayor cantidad de mutación, podremos observar que estos son

```
Gene	# Mut	#	Freq
TP53	58	55	55.0%
TTN	75	41	41.0%
MUC16	31	24	24.0%
SYNE1	27	22	22.0%
CSMD1	22	19	19.0%
```

En este caso, nuestro objetivo es estudio está en las mutaciones comunes para pacientes de cáncer que portan una infección con *H. pylori*. Por lo que, seleccionando a este sub-grupo, encontramos los siguientes genes:

```
Gene	# Mut	#	Freq
TP53	25	24	52.2%
TTN	33	22	47.8%
MUC16	11	10	21.7%
ARID1A	11	9	19.6%
FLG	10	8	17.4%
```

Acá se observa que los genes *ARID1A* y *FLG* están entre los con mayor cantidad de mutaciones. Sin embargo, la diferencia con respecto al total de pacientes es mínima (*ARID1A*: 16.7%; *FLG*: 16.7%), por lo que difícilmente puede asociarse particularmente a una característica de la infección.

Por otro lado, con respecto a los genes *SYNE1* y *CSMD1*, se aprecia que CSMD presenta una frecuencia similar en pacientes *H. pylori* positivos (15.2%). Sin embargo, se observan diferencias notables para *SYNE1* (10.9% vs 22% en el total de pacientes). Por lo tanto, nos enfocaremos en este gen particular para estudiar las diferencias entre pacientes que portan la infección.

- ¿Cuántos pacientes portan la infección?: 

22 en total, y 5 pacientes HP-positivos.
- ¿Qué tipo de mutación es más frecuente (missense, nonsense, frameshift)?: 

Se observa que todas las mutaciones son missense, con excepción de ún caso donde es missense

[](../img/syne1_mut.png)

Además, todas estas mutaciones son puntuales.

- ¿Qué vías de señalización aparecen alteradas en la pestaña Pathways?
Se encuentran 10 vías de señalización alteradas, de entre las cuales, en ningúna SYNE-1 juega un papel clave.

[](../img/pathways.png)

## Análisis clínico
Se encuentra la siguiente distribución de sexo y edad de diagnóstico:
[](../img/sex.png)
[](../img/diag_age.png)

Se tiene entonces que:
- El grupo no alterado (que no presenta mutaciones en syne1) presenta una edad máxima y mínima de 89 y 32, respectivamente. Así, tiene un rango de edad de 57 años y una mediana de 67.5
- Los pacientes con SYNE1 mutado presentan edad máxima y mínima de 84 y 41, respectivamente. Con un rango de edad 43 años y una mediana de 72.

Se observa que el grupo SYNE-1 alterado presenta, aparentemente, mayor edad de diagnóstico. Sin embargo, observando al hacer comparaciones estadísticas, se encuentran las siguientes asociaciones clínicas:

[](../img/clin_assoc.png)

Así, ni la edad de diagnóstico, ni el sexo parecen ser más predominantes respecto a las mutaciones SYNE1. Además, se observa que las diferencias respecto a la infección de *H. pylori* no son significativas, posiblemente debido a la baja potencia estadística).

## Análisis y conclusión
Se aprecia una tendencia a que los pacientes de adenocarcinoma gástrico no infectados con *H. pylori* presentan una menor tasa de mutación en el gen SYNE1. Sin embargo, esta asociación no se puede confirmar entre otras cosas debido a una falta de poder estadístico. Estudios con mayor cantidad de pacientes, y con mayor profundidad en el estudio del gen SYNE1 y de aquellos que interactúan con él podría profundizar nuestro conocimiento de la susceptibilidad del cáncer gástrico y la infección con *H. pylori*.

SYNE1 es un gen particularmente poco estudiado. Interactúa con proteínas del enlace nucleo-citoesqueleto (LNC). En particular, estudios entre este gen y el cáncer son poco. Haciendo búsqueda rápida por PubMed, se encuentran 145 artículos al respecto:

[](../img/pubmed.png)

Así, es un gen a estudiar cuyos mecanismos asociados al cáncer podrían profundizar nuestro entendimiento de esta enfermedad a nivel celular y estructural.


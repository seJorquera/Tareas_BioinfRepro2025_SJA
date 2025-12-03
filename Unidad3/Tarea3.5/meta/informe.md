# Informe Tarea 3.5
**Autor**: Samuel Jorquera

En el presente informe se detallan los procedimientos y resultados llevados a cabo para la tarea n°5 del curso de bioinformática reproducible.

## Introducción

En el contexto de análisis de datos de secuenciación NGS, el workflow común consiste en un preprocesado desde un formato fastq –es decir, eliminación de reads de baja calidad y que no cumplen con determinados criterios–, para luego hacer un alineamiento con un genoma de referencia, y, finalmente, un llamado de variantes desde las secuencias alineadas.

En general, se trata de un proceso estándar, en el que las principales diferencias radican en los parámetros umbrales a escoger. Así, en algunos procedimientos, tales como análisis de asociación, podríamos bucar reads de mayor calidad. Sin embargo, estas diferencias son fácilmente aplicables, de modo que el flujo de trabajo puede ser tedioso, y propenso a errores.

Así, surge SAREK, una pipeline de trabajo que automatiza este proceso mediante la herramienta nfcore. En SAREK, se recibe un archivo fastq, desde el cual, se realiza el preprocesado, alineamiento y llamado de variantes de manera automática. Al ser de código abierto, se pueden modificar las opciones de alineamiento, filtrado, u otros.

----


## Metodología

### Ejecución de pipeline de SAREK
Para el llamado de variantes se utilizará la pipeline SAREK. En primer lugar, todos los procedimientos se llevaron a cabo dentro del directorio ```pipeline_sarek```. En él, los archivos de código ```sarek_somatic.sh``` y ```sarek_germinal.sh```, junto con opciones de configuración se encuentran en la carpeta ```code```. Por otro lado, en el directorio ```data``` se encontraron los archivos fastq utilizados para la ejecución del pipeline. En particular, la muestra utilizada corresponde a S10, y se encuentra en la carpeta ```~/181004_curso_calidad_datos_NGS/fastq_raw/```. Los archivos fueron copiados y renombrados a simplemente ```R1.fastq.gz``` y ```R2.fastq.gz``` para los datos R1 y R2, respectivamente.

```bash
## Copiar archivos R1 y R2
cp ~/181004_curso_calidad_datos_NGS/fastq_raw/S10_R1.fastq.gz .
cp ~/181004_curso_calidad_datos_NGS/fastq_raw/S10_R2.fastq.gz .

##Renombrar
mv S10_R1.fastq.gz R1.fastq.gz
mv S10_R2.fastq.gz R2.fastq.gz
```

El cambio de nombre se realizó pues sólo se ejecuta el análisis 1 vez. De todas maneras, sarek es capaz de ejecutarse aún cuando el comando esté escrito como ```S10_R1.fastq.gz```.

Finalmente, se ejecuta el pipeline de sarek utilizando los scripts previamente definidos. Es importante activar previamente el pipeline mediante el comando ```pyenv activate sarek_taller-pyenv```, para luego ejecutar:

```bash
#Germinal
bash sarek_germinal.sh ../data/R1.fastq.gz ../data/R2.fastq.gz ../results S10

#Somatico
bash sarek_somatic.sh ../data/R1.fastq.gz ../data/R2.fastq.gz ../results S10
```

En este caso, los scripts pueden recibir 3 o 4 argumentos, La opción final entregada ```S10``` permite guardar los resultados bajo el nombre de la muestra S10. Los archivos son guardados en el directorio recién creado ```results```, dentro del directorio de ejecución del pipeline.

### Anotación de variantes
Luego de hacer el llamado de variantes mediante el pipeline de sarek, se anotaron variantes utilizando ```snpEff``` (v5.4a). En particular, se ejecutó mediante los comandos:
```bash
$ gunzip -c ../../variant_calling/haplotypecaller/S10/S10.haplotypecaller.filtered.vcf.gz | snpEff ann -Xmx8g GRCh38.86 > S10_germinal.ann.vcf

$ gunzip -c ../../variant_calling/mutect2/S10/S10.mutect2.filtered.vcf.gz| snpEff ann -Xmx8g GRCh38.86 > S10_somatic.ann.vcf
```
Generando así los archivos ```S10_germinal.ann.vcf``` con variantes germinales anotadas, y ```S10_somatic.ann.vcf```. Una vez anotadas, se utilizó los reportes resumen generados por snpEff para comparar entre variantes somáticas y germinales.
----

## Resultados

### Calidad
En primer lugar, podemos observar la calidad de las muestras una vez preprocesados y alineados los datos de secuenciación, previos al llamado de variantes. Este reporte de calidad en este caso es elaborado por Multiqc (v1.31), el cual puede ser consultado [aquí](../results/multiqc/multiqc_report.html). Encontramos que hay una buena calidad de lectura para ambos archivos. De modo que se puede proseguir correctamente con el pipeline.

### Somaticas vs germinales
Podemos revisar el número de variantes germinales y somáticas encontradas mediante el comando

```bash
gzcat S10.filtered.vcf.gz | grep -v '^#' | wc -l
```

En particular, las variantes somáticas se encuentran en ```variant_calling/haplotypecaller/S10/S10.haplotypecaller.filtered.vcf.gz``` y las germinales en ```variant_calling/mutect2/S10/S10.mutect2.filtered.vcf.gz```, en donde observamos 122 y 182 variantes, respectivamente.

Luego, podemos estudiar el tipo de variantes encontradas. Para ello, se realizó anotado de variantes sobre la base del genoma de referencia hg19 (```GRCh38.86```), con el que se identificaron los tipos de variante, y su impacto.

En los siguientes archivos se puede consultar el resumen de anotación de variantes [germinales](../results/anovar/germinal/snpEff_summary.html) y [somáticas](../results/anovar/somatic/snpEff_summary.html)

En variantes germinales, se encuentra que el 55.7% de las variantes son conocidas (ID atribuido) de ellas, 89 son SNPs, 11 son inserciones y 22 son deleciones. 13 son de riesgo alto, 62 de riesgo moderado y 69 de riesgo bajo. Por otra parte, 69 son variantes missense, 6 nonsense y 39 son silenciosas. Finalmente, solo 7 son variantes frameshift, 25 son de región de splice, y 6 son de ganancia de STOP. El cromosoma con mayor cantidad de variantes halladas es el 13.

Mientras que para variantes somáticas, 137 son SNPs, 6 son MNPs (cambios de 2 o más bases consecutivos), 33 inserciones y 7 deleciones. De ellas, 34 son de riesgo alto, 125 moderado y 49 bajo. 138 corresponden a variantes missense, 6 nonsense y 51 variantes son silenciosas. Finalmente, hay 13 frameshift variants, 60 en región de splice y 9 de ganancia de STOP. Nuevamente, el cromosoma más afectado es el 13.

Se encuentra que, claramente, las variantes somáticas encontradas son de mayor impacto y tienen mayor efecto en la funcionalidad. Esto tiene sentido, pues la presencia de variantes germinales de alto impacto serían inviables biológicamente.


### Estudio de variantes

Las variantes fueron estudiadas para reconocer qué efectos podrían tener, su frecuencia en poblaciones y profundizar en sus efectos, usando las bases de gnomAD para variantes germinales, y oncoKB para somáticas. En particular, estudiaremos las anotadas por snpEff únicamente como alto impacto

#### Germinales
En este caso, queremos trabajar con variantes conocidas, por lo que, en primer lugar, debemos asegurarnos que tengan un ID. para ello, podemos filtrar primero por variantes que tengan ```rs```. Luego, podemos bucar variantes de riesgo moderado-alto. Para ello, escogeremos simplemente variantes missense, quedando entonces el filtrado según:

```bash
cat S10_germinal.ann.vcf | grep 'rs' | grep 'missense_variant' > S10_filtered.ann.vcf
```

Así, nos quedamos con 8 variantes: 
- rs3780135: Corresponde al SNP 9-36840626-G-A, en el gen de PAX5. Según ClinVar, está clasificada como benigna, lo que se condice con el impaco moderado otorgado por snpEff. Su frecuencia es bastante alta, con un 0.91, llegando hasta un 0.95 en población europea.
- rs1933437: Corresponde al SNP 13-28050157-G-A o G-T (en nuestro caso, G-A, G-T es bastante menos frecuente). En el gen FLT3. Nuevamente, clasificada como benigna, pero también asociada con condición de neoplasia, lo que indica que debería tener un riesgo moderado/alto. Su frecuencia es 60%, llegando a 76% en el este de asia
- rs144848: SNP 13-32332592-A-C en BRCA2. Claramente está asociado a neoplasia, aunque su impacto está clasificado como benigno. Su frecuencia es del 27.6%, con judíos ashkenazis teniendo un 35% de frecuencia.
- rs169547: SNP 13-32355250-T-C en BRCA2 nuevamente. Asociado nuevamente a predisposición BRCA a cancer, y a cáncer hereditario. Su frecuencia es aproximadamente del 99.6%, siendo de aproximadamente el 100% en múltiples poblaciones de diversas ancestrías.
- rs1799966: SNP 17-43071077-T-C en BRCA1. También asociado a predisposición a cáncer. Tiene una frecuencia del 33%, siendo más frecuente en el sur de asia, con un aproximado de 50% de frecuencia alélica
- rs16942: SNP 17-43091983-T-C en BRCA1. Una vez más, asociado a predispocisión a cáncer por BRCA. Comparte una frecuencia alélica muy similar al gen anterior, posiblemente porque se encuentran en desequilibrio de ligamiento (se heredan juntos).
- rs4986852: SNP 17-43092412-C-T en BRCA1. Nuevamente, asociado a cáncer hereditario y predisposición. Posee una frecuencia del 1.9%, llegando a un 8% en población Amish.
- rs1049481: SNP 19-12943967-G-T en gen de CALR. Ha sido clasificado como benigno, sin embargo, no se asocia a ninguna condición particular. Tiene una frecuencia del ~60%, con un 81% en población del este de asia.

Así, se concluye que la muestra consiste de un paciente con una alta predisposición al desarrollo de malignancias. En particular, cáncer de mamas y cáncer pancreático.


#### Somáticas

De los genes encontrados de alto impacto, sólo encontramos 4 que corresponden a cambios de base, estos son:
- 7-148847226-G-A: Variante ganancia de STOP en gen EZH2. Se clasifica como Tier-III según los estándares AMP/ASCO/CAP. Hay evidencia que de su potencial terapéutico. No tiene ninguna terapia aprobada. EZH2 es un oncogen conocido.
- 9-5064882-G-C: Variante en región splice de gen JAK2. No se encuentra clasificada según los estándares AMP/ASCO/CAP
- 9-5090444-A-C: Variante en región splice de gen JAK2. No se encuentra clasificada según los estándares AMP/ASCO/CAP.
- 13-32376669-G-A Variante en región splice de gen BRCA2. No se encuentra clasificada según los estándares AMP/ASCO/CAP.


Por otro lado, buscamos variantes missense en los genes clásicos asociados a cáncer: BRCA1, BRCA2, KRAS, TP53, VEGFA, BRAF y JAK1, 2 y 3. Esto se consigue mediante el comando

```bash
cat somatic/S10_somatic.ann.vcf | grep 'missense_variant' | grep -E 'BRCA1|BRCA2|KRAS|TP53|VEGFA|BRAF|JAK1|JAK2|JAK3' > S10_somatic_missense.ann.vcf
```

Obtenemos 16 variantes, las cuales estudiamos:

- 7-140834680-C-T: BRAF A145T. Se clasifica como TIER-III. Está predicha como benigna. No ha sido clasificada en OncoKB.
- Hay 4 variantes en JAK2: P775L, R922L, R923L, N924H Todas son tier-III y algunas de ellas han sido predichas como patogénicas. Ninguna está clasificada en OncoKB.
- 12-25209889-G-C: KRAS T158R. Se clasifica como tier-III, y no se predicen efectos patogénico. no está clasificada en oncoKB.
- 2 Variantes en BRCA2: T867S y N2879S. Ambas Tier-III, ambas predichas como benigna. Ninguna está en oncoKB.
- 7 variantes en BRCA1: S1634G, P1565S, S1040N, Q1038G, G828S, K820I y A397V. Todas Tier-III, algunas predichas patogénicas y otras benignas. Ninguna en OncoKB.
- 19-17842504-C-T: KRAS A225T. Tier-III, predicho efecto benigno. No está en oncoKB.

Así, se encuentra que, de las variantes somáticas, ninguna está clasificada directamente como tier II o I según los estándares AMP/ASCO/CAP. Se encuentran numerosas variantes de alto impacto, las cuales seguramente implicarán pérdida de función en genes supresores, o ganancia de funciones en genes oncogénico. De cualquier manera, ninguno de los genes encontrados parece explicar una posible patogenicidad. 



----
## Discusión y Conclusiones

En el presente trabajo se empleó el pipeline SAREK para el procesamiento desde un archivo inicial de lecturas de secuenciación, hasta un llamado de variantes. Para luego, hacer un estudio mediante anotación y establecimiento *in silico* de riesgo genético.

Se encontró que la muestra poseía un gran número de variantes genéticas en genes asociados a susceptibilidad y causales de cáncer. En particular, se observaron variaciones somáticas y germinales, las cuales permitieron notar una clara predisposición al desarrollo de malignancias y la presencia de mutaciones proto-oncogénicas.

Se reporta que la calidad de la secuenciación es apropiada, al obtener muestras con buena cobertura y Q-score. Las variantes encontradas fueron filtradas, y, posterior a la anotación, se trabajaron con variantes relevantes.

Si bien no se encontraron variantes que permitan comprender una malignancia, la suma de ellas denota una clara alteración en genes asociados a la susceptibilidad a desarrollar este tipo de enfermedades.











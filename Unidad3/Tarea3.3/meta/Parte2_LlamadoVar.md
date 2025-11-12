# Parte 2 de la Tarea 3.3: Llamado de variantes

**Autor**: Samuel Jorquera

1. Seguir este tutorial con los datos de la muestra previamente elegida. Todas las muestras son de pacientes, para los cuales se sospechaba de una mutación patogénica. Se realizó una secuenciación de un panel de genes con equipamiento MiSeq.

En este caso, para el llamado de variantes, se prosiguió con todas las variantes usando el comando:

```bash
java -jar /opt/GenomeAnalysisTK-3.7-0/GenomeAnalysisTK.jar 
-T HaplotypeCaller 
-R /datos/reference/genomes/hg19_reference/hg19.fasta 
-I S10_recall_reads.bam 
--dbsnp /datos/reference/genomes/hg19_reference/dbSNP_hg19.vcf 
-stand_call_conf 30 
-o S10_raw_variants.vcf
```

En contraste con el repositorio del curso, se elimina la flag ```-L "chr19"```

---
2. En materiales y métodos del reporte, indique el número de genes incluidos en el panel e incluya una tabla con la lista de genes (consejo: revise el archivo regiones_blanco.bed). Indique también la región genómica total (en pares de bases) cubierta por el panel, o sea, el tamaño de las regiones blanco (consejo: revise su reporte qualimapReport.html).




---
3. Realice el filtrado de variantes con dos filtros, DP<10 y uno adicional que usted proponga.

El primer filtrado se hace únicamente con ```DP <10```:

```
java -jar /opt/GenomeAnalysisTK-3.7-0/GenomeAnalysisTK.jar -T VariantFiltration -R /datos/reference/genomes/hg19_reference/hg19.fasta -V S10_RAW_SNP.vcf --filterExpression "DP <10" --filterName "FILTER" -o S10_FILTERED1_SNP.vcf
```

El siguiente filtro, se realizará con ```QD``` (Qualitiy score over depth), que indica la calidad de la profundidad. En particular, se filtrarán solo aquellos ```QD <2.0```. A este filtro se le asignará el nombre ```filter2```:

```
java -jar /opt/GenomeAnalysisTK-3.7-0/GenomeAnalysisTK.jar -T VariantFiltration -R /datos/reference/genomes/hg19_reference/hg19.fasta -V S10_RAW_SNP.vcf --filterName "filter1" --filterExpression "(DP <10)" --filterName "filter2" --filterExpression  "(QD <2.0)" -o S10_FILTERED2_SNP.vcf
```

---
4. Estime cuántas variantes son eliminadas por el filtro DP<10 solamente, y cuántas por ambos filtros.

Podemos observar directamente las variables filtradas mediante el siguiente comando:

```bash
grep -v '^##' Archivo.vcf | grep -v 'PASS'
```

Esto pues el formato vcf cuenta con un header que comienza con ```##``` y posteriormente la función ```VariantFiltration```de GATK genera un atributo ```FILTER```para cada variante, en la que le asigna el valor ```PASS```si entra dentro de los 2 filtros, o el nombre del filtro (```filter1``` o ```filter2``` en este caso). Por lo tanto, con el segundo revisamos aquellas variantes filtradas.

Para el archivo ```S10_FILTERED1_SNP.vcf```Se encuentra lo siguiente:
```bash
#CHROM	POS	ID	REF	ALT	QUAL	FILTER	INFO	FORMAT	sample
chr2	198265173	rs788017	T	A	43.14	FILTER	AC=2;AF=1.00;AN=2;DB;DP=3;ExcessHet=3.0103;FS=0.000;MLEAC=2;MLEAF=1.00;MQ=60.00;QD=14.38;SOR=1.179	GT:AD:DP:GQ:PL	1/1:0,3:3:9:79,9,0
chr7	148506396	rs41277434	A	C	119.84	FILTER	AC=2;AF=1.00;AN=2;DB;DP=6;ExcessHet=3.0103;FS=0.000;MLEAC=2;MLEAF=1.00;MQ=60.00;QD=19.97;SOR=0.693	GT:AD:DP:GQ:PL	1/1:0,6:6:18:148,18,0
chr13	28610183	rs2491231	A	G	54.74	FILTER	AC=2;AF=1.00;AN=2;DB;DP=2;ExcessHet=3.0103;FS=0.000;MLEAC=2;MLEAF=1.00;MQ=60.00;QD=27.37;SOR=2.303	GT:AD:DP:GQ:PL	1/1:0,2:2:6:82,6,0
chr13	72252998	.	C	G	107.28	FILTER	AC=2;AF=1.00;AN=2;DP=3;ExcessHet=3.0103;FS=0.000;MLEAC=2;MLEAF=1.00;MQ=60.00;QD=32.97;SOR=2.833	GT:AD:DP:GQ:PL	1/1:0,3:3:9:135,9,0
chr17	41245865	.	A	T	71.03	FILTER	AC=2;AF=1.00;AN=2;DP=4;ExcessHet=3.0103;FS=0.000;MLEAC=2;MLEAF=1.00;MQ=60.00;QD=17.76;SOR=0.693	GT:AD:DP:GQ:PL	1/1:0,4:4:12:99,12,0
chr19	33792586	.	G	A	62.74	FILTER	AC=2;AF=1.00;AN=2;DP=2;ExcessHet=3.0103;FS=0.000;MLEAC=2;MLEAF=1.00;MQ=60.00;QD=31.37;SOR=0.693	GT:AD:DP:GQ:PL	1/1:0,2:2:6:90,6,0
chr19	33792597	.	C	A	62.74	FILTER	AC=2;AF=1.00;AN=2;DP=2;ExcessHet=3.0103;FS=0.000;MLEAC=2;MLEAF=1.00;MQ=60.00;QD=31.37;SOR=0.693	GT:AD:DP:GQ:PL	1/1:0,2:2:6:90,6,0
```

Mientras que para el archivo ```S10_FILTERED2_SNP.vcf```:
```bash
#CHROM	POS	ID	REF	ALT	QUAL	FILTER	INFO	FORMAT	sample
chr2	198265173	rs788017	T	A	43.14	filter1	AC=2;AF=1.00;AN=2;DB;DP=3;ExcessHet=3.0103;FS=0.000;MLEAC=2;MLEAF=1.00;MQ=60.00;QD=14.38;SOR=1.179	GT:AD:DP:GQ:PL	1/1:0,3:3:9:79,9,0
chr7	148506396	rs41277434	A	C	119.84	filter1	AC=2;AF=1.00;AN=2;DB;DP=6;ExcessHet=3.0103;FS=0.000;MLEAC=2;MLEAF=1.00;MQ=60.00;QD=19.97;SOR=0.693	GT:AD:DP:GQ:PL	1/1:0,6:6:18:148,18,0
chr13	28610183	rs2491231	A	G	54.74	filter1	AC=2;AF=1.00;AN=2;DB;DP=2;ExcessHet=3.0103;FS=0.000;MLEAC=2;MLEAF=1.00;MQ=60.00;QD=27.37;SOR=2.303	GT:AD:DP:GQ:PL	1/1:0,2:2:6:82,6,0
chr13	32899268	.	G	T	33.77	filter2	AC=1;AF=0.500;AN=2;BaseQRankSum=2.450;ClippingRankSum=0.000;DP=75;ExcessHet=3.0103;FS=0.000;MLEAC=1;MLEAF=0.500;MQ=60.00;MQRankSum=0.000;QD=0.45;ReadPosRankSum=0.452;SOR=0.859	GT:AD:DP:GQ:PL	0/1:64,11:75:62:62,0,1358
chr13	72252998	.	C	G	107.28	filter1	AC=2;AF=1.00;AN=2;DP=3;ExcessHet=3.0103;FS=0.000;MLEAC=2;MLEAF=1.00;MQ=60.00;QD=32.97;SOR=2.833	GT:AD:DP:GQ:PL	1/1:0,3:3:9:135,9,0
chr17	41245865	.	A	T	71.03	filter1	AC=2;AF=1.00;AN=2;DP=4;ExcessHet=3.0103;FS=0.000;MLEAC=2;MLEAF=1.00;MQ=60.00;QD=17.76;SOR=0.693	GT:AD:DP:GQ:PL	1/1:0,4:4:12:99,12,0
chr17	41256178	.	G	T	66.77	filter2	AC=1;AF=0.500;AN=2;BaseQRankSum=0.035;ClippingRankSum=0.000;DP=51;ExcessHet=3.0103;FS=0.000;MLEAC=1;MLEAF=0.500;MQ=60.00;MQRankSum=0.000;QD=1.31;ReadPosRankSum=0.543;SOR=0.648	GT:AD:DP:GQ:PL	0/1:41,10:51:95:95,0,863
chr17	41258628	.	T	A	55.77	filter2	AC=1;AF=0.500;AN=2;BaseQRankSum=0.000;ClippingRankSum=0.000;DP=38;ExcessHet=3.0103;FS=0.000;MLEAC=1;MLEAF=0.500;MQ=60.00;MQRankSum=0.000;QD=1.47;ReadPosRankSum=0.000;SOR=0.693	GT:AD:DP:GQ:PL	0/1:30,8:38:84:84,0,628
chr19	33792586	.	G	A	62.74	filter1	AC=2;AF=1.00;AN=2;DP=2;ExcessHet=3.0103;FS=0.000;MLEAC=2;MLEAF=1.00;MQ=60.00;QD=31.37;SOR=0.693	GT:AD:DP:GQ:PL	1/1:0,2:2:6:90,6,0
chr19	33792597	.	C	A	62.74	filter1	AC=2;AF=1.00;AN=2;DP=2;ExcessHet=3.0103;FS=0.000;MLEAC=2;MLEAF=1.00;MQ=60.00;QD=31.37;SOR=0.693	GT:AD:DP:GQ:PL	1/1:0,2:2:6:90,6,0
```

Por último, para no contar las líneas manualmente se emplea el comando ```grep -v '^##' Archivo.vcf | grep -v 'PASS' | grep -v '^#' | wc -l```, siendo 7 para el filtro ```DP<10```y 

---
5. Genere un reporte e incluya una tabla con el número de variantes detectadas totales, SNPs, e INDELs. Para cada caso, indicar el número de variantes filtradas y que pasaron los filtros (solo uno, y ambos)



---
6. Visualice una variante en IGV, mostrando tracks tanto para el alineamiento (bam) como las variantes detectadas (VCF).



---
7. Asegúrese de usar un tamaño de ventana que muestre suficiente detalle como para leer la secuencia de referencia, pero sin un zoom excesivo para que se logre ver algo de contexto de secuencia. Ojalá que se vean otras variantes al rededor de la central. Incluya un track con los genes. Si no se ve ningún gen cercano a la variante, elija otra variante.



---
8. En resultados, indique en formato de tabla el número de variantes detectadas según ubicación (intrónica, río arriba, río abajo, codificante con cambio de sentido, sin sentido, etc).



---
9. Realice una anotación de las variantes con la herramienta en línea VEP. Asegúrese de usar la versión del genoma que utilizó en el alineamiento. Incluya anotaciones de Significancia clínica y puntajes CADD. Baje la tabla de variantes anotadas en formato TXT y fíltrela (por ejemplo en R) para generar una tabla que solo contenga variantes con un valor distinto a "benign" en la columna "CLIN_SIG" o un valor de CAAD > 20. Incluya incluya la tabla filtrada en su informe (si hubo variantes que pasaron los filtros) e interprete sus resultados.



---
10. En la sección conclusiones, asegúrese de concluir algo sobre la muestra (presencia o no de mutaciones con potencial patogénico).
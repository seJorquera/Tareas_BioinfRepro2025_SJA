# Respuestas tarea02

**Author:** Samuel Jorquera	


**Ejercicio:** Mira el siguiente script ([tomado del manual de *stacks*](https://catchenlab.life.illinois.edu/stacks/manual/#phand).

```bash
#!/bin/bash

src=$HOME/research/project

files=”sample_01
sample_02
sample_03”

#
# Build loci de novo in each sample for the single-end reads only. If paired-end reads are available, 
# they will be integrated in a later stage (tsv2bam stage).
# This loop will run ustacks on each sample, e.g.
#   ustacks -f ./samples/sample_01.1.fq.gz -o ./stacks -i 1 --name sample_01 -M 4 -p 8
#
id=1
for sample in $files
do
    ustacks -f $src/samples/${sample}.1.fq.gz -o $src/stacks -i $id --name $sample -M 4 -p 8
    let "id+=1"
done

# 
# Build the catalog of loci available in the metapopulation from the samples contained
# in the population map. To build the catalog from a subset of individuals, supply
# a separate population map only containing those samples.
#
cstacks -n 6 -P $src/stacks/ -M $src/popmaps/popmap -p 8

#
# Run sstacks. Match all samples supplied in the population map against the catalog.
#
sstacks -P $src/stacks/ -M $src/popmaps/popmap -p 8

#
# Run tsv2bam to transpose the data so it is stored by locus, instead of by sample. We will include
# paired-end reads using tsv2bam. tsv2bam expects the paired read files to be in the samples
# directory and they should be named consistently with the single-end reads,
# e.g. sample_01.1.fq.gz and sample_01.2.fq.gz, which is how process_radtags will output them.
#
tsv2bam -P $src/stacks/ -M $src/popmaps/popmap --pe-reads-dir $src/samples -t 8

#
# Run gstacks: build a paired-end contig from the metapopulation data (if paired-reads provided),
# align reads per sample, call variant sites in the population, genotypes in each individual.
#
gstacks -P $src/stacks/ -M $src/popmaps/popmap -t 8

#
# Run populations. Calculate Hardy-Weinberg deviation, population statistics, f-statistics
# export several output files.
#
populations -P $src/stacks/ -M $src/popmaps/popmap -r 0.65 --vcf --genepop --structure --fstats --hwe -t 8

```

1. Cuántos pasos tiene este script?

Tiene 6 pasos. Además tiene 2 variables: "scr" y "files"

2. ¿Si quisieras correr este script y que funcionara en tu propio equipo, qué línea deberías cambiar y a qué?

Modificar las variables src y files

3. ¿A qué equivale $HOME?

Es una variable para el usuario. Corresponde al directorio por default.

4. ¿Qué paso del análisis hace el programa gsnap?

???

Me imagino que se refiere a gstacks. Esta función es utilizada en el paso 5. 



5. ¿Qué hace en términos generales cada uno de los loops?

En este caso hay un único loop. En particular, el loop

```bash
id=1
for sample in $files
do
    ustacks -f $src/samples/${sample}.1.fq.gz -o $src/stacks -i $id --name $sample -M 4 -p 8
    let "id+=1"
done

```

Aplica la función ustachs sobre las distintas muestras. Recibe archivos en formato "sampleX.1.fq.gz". A priori, debe aplicar alguna transformación sobre los datos de un formato específico para ser ejecutado por cstacks, sstacks y tsv2bam. A juzgar por este último, deja los archivos sampleX.1.fq.gz en formato sampleX.tsv. Finalmente, asigna un ID a cada sample sobre el que se ejecuta el script.
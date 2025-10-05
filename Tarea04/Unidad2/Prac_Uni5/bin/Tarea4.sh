#!/bin/bash

module load vcftools/0.1.13
which vcftools

module load R/4.0.5
which R

#1: Individuos y variantes
num=$(grep -m1 "^#CHROM" /datos/compartido/ChileGenomico/GATK_ChGdb_recalibrated.autosomes.12262013.snps.known.vcf | wc -w)
indiv=$((num-9))
variantes=$(grep -v "^#" /datos/compartido/ChileGenomico/GATK_ChGdb_recalibrated.autosomes.12262013.snps.known.vcf | wc -l)
echo "Cantidad de individuos: $indiv - Numero de variantes $variantes"

#2: Variantes sin info perdida
vcftools --vcf /datos/compartido/ChileGenomico/GATK_ChGdb_recalibrated.autosomes.12262013.snps.known.vcf --max-missing 1

#3: Archivo
vcftools --vcf /datos/compartido/ChileGenomico/GATK_ChGdb_recalibrated.autosomes.12262013.snps.known.vcf --chr 15 --from-bp 50000000 --to-bp 52000000 --recode -c > ../data/CLG_Chr15_50-52Mb.vcf

#4 variantes en archivo generado
variantes2=$(grep -v "^#" ../data/CLG_Chr15_50-52Mb.vcf | wc -l)
echo "En el nuevo archivo hay $variantes2 variantes"

#5: Covertura
vcftools --vcf ../data/CLG_Chr15_50-52Mb.vcf --depth
echo "covertura por individuo:"
while read -r ind; do
	echo "$ind"
done < "out.idepth"

#6: 
vcftools --vcf ../data/CLG_Chr15_50-52Mb.vcf --freq --out ../data/CLG_Chr15_50-52Mb_freqs

#7:
awk '$3 == 2' ../data/CLG_Chr15_50-52Mb_freqs.frq > ../data/CLG_Chr15_50-52Mb_freqs_biallele.frq

#8 y 9: maf_frq.R realiza 8 y 9 al mismo tiempo

Rscript --no-save maf_frq.R

#10
vcftools --vcf ../data/CLG_Chr15_50-52Mb.vcf --het
echo "heterocigocidad por individuo:"
while read -r ind; do
        echo "$ind"
done < out.het

#11
vcftools --vcf ../data/CLG_Chr15_50-52Mb.vcf --site-pi --out nucleotide_diversity

#12
vcftools --vcf ../data/CLG_Chr15_50-52Mb.vcf --maf 0.05 --recode  --out ../data/CLG_Chr15_50-52Mb_maf

#13
vcftools --vcf ../data/CLG_Chr15_50-52Mb_maf.recode.vcf --plink --out ../data/CLG_Chr15_50-52Mb_maf.recode

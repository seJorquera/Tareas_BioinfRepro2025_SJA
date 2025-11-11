# Alignment quality report
**Author**: Samuel Jorquera Acevedo

## Introduction

In the context of the course "Reproducible research and bioinformatics for genomic analyses", a paired-ended sequence was filtered by quality and aligned with the reference genome *hg19*. (General methodology can be consulted [here](https://github.com/u-genoma/BioinfinvRepro/blob/master/Unidad3/Sesion3/Tutorial_filtro_alineamiento_lecturas_chilegenomicolab.md)).

## Results
Using the software ```qualimap``` general quality report was obtained. general alignment coverage from reference genome was 0.4%. From reads, 99.2% were mapped succesfully with reference genome. 87.91% of mapped reads were duplicated.

In mapped reads, the mean of coverage was 102.08 (Fig 1). Quality of reads had a mean of 58.82, and most of read had a quality of 60 (Fig 2).

![](../data/S10_sorted_RG/images_qualimapReport/genome_coverage_across_reference.png)
**Figure 1**: Genomic coverage across refernce. Coverage for each position across the reference genome in presented. Below, is presented GC% content for each read aswell.

![](../data/S10_sorted_RG/images_qualimapReport/genome_mapping_quality_histogram.png)
**Figure 2**: Histogram of quality in mapped reads.

Finaly, a few INDELs were observed. In particular, most of them (61.33%) consisted of homopolymers (Fig 3). However, the biggest group between INDELs were monomers.

![](../data/S10_sorted_RG/images_qualimapReport/genome_homopolymer_indels.png)
**Figure 3**: INDELs in mapped region. Homopolymers ar presented for each homopolymer (PolyA, polyG, polyC and polyT), non homopolymers consists of single nucleotide INDELs.

## Conclusions

In general, alignment shows a high quality of sequencing. In mapped regions coverage was sufficient, and Q-score of read was 60 for most of the reads. GC content is


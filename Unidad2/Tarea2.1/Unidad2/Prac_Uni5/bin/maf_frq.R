# Script that reads "../data/CLG_Chr15_50-52Mb_freqs_biallele.frq" and creates an histogram

maf_freq <- read.table (file="../data/CLG_Chr15_50-52Mb_freqs_biallele.frq", header=TRUE)
pdf("maf_frq_hist.pdf")


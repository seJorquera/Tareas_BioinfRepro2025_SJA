input_dir  <- file.path("~/RNA_seq/","count")
output_pseudo <- file.path("..","diff_expr", "pseudocounts") 
output_histogram <- file.path("..","diff_expr", "histograms") 
output_pvalue_fdr <- file.path("..","diff_expr", "pvalue_fdr") 
output_table <- file.path("..","diff_expr", "tables")

if(!file.exists(input_dir)){
  stop("Data directory doesn't exist: ", input_dir)
}

if(!file.exists(output_pseudo)){
  dir.create(output_pseudo, mode = "0755", recursive=T)
}

if(!file.exists(output_histogram)){
  dir.create(output_histogram, mode = "0755", recursive=T)
}

if(!file.exists(output_pvalue_fdr)){
  dir.create(output_pvalue_fdr, mode = "0755", recursive=T)
}

if(!file.exists(output_table)){
  dir.create(output_table, mode = "0755", recursive=T)
}


library(edgeR)

wild_p <- read.delim(file=file.path(input_dir, "MW001_P.count"), sep="\t", header = F, check=F); colnames(wild_p) <- c("Gen_ID", "Count")
wild_b <- read.delim(file=file.path(input_dir, "MW001_B3.count"), sep="\t", header = F, check=F); colnames(wild_b) <- c("Gen_ID", "Count")
mut_p <- read.delim(file=file.path(input_dir, "0446_P.count"), sep="\t", header = F, check=F); colnames(mut_p) <- c("Gen_ID", "Count")
mut_b <- read.delim(file=file.path(input_dir, "0446_B3.count"), sep="\t", header = F, check=F); colnames(mut_b) <- c("Gen_ID", "Count")

rawcounts <- data.frame(wild_p$Gen_ID, WildType_P = wild_p$Count, WildType_B = wild_b$Count, Mutant_P = mut_p$Count, Mutant_B = mut_b$Count, row.names = 1)

rpkm <- cpm(rawcounts)

to_remove <- rownames(rawcounts) %in% c("__no_feature","__ambiguous","__too_low_aQual","__not_aligned","__alignment_not_unique")
keep <- rowSums(rpkm > 1) >= 3 & !to_remove
rawcounts <- rawcounts[keep,]


group_culture <- c("planctonic","biofilm","planctonic","biofilm")
dge_culture <- DGEList(counts = rawcounts, group = group_culture)
dge_culture <- calcNormFactors(dge_culture)

dge_culture <- estimateCommonDisp(dge_culture)
dge_culture <- estimateTagwiseDisp(dge_culture)

de_culture <- exactTest(dge_culture, pair = c("planctonic","biofilm"))

results_culture <- topTags(de_culture, n = nrow(dge_culture)) 
results_culture <- results_culture$table

ids_culture <- rownames(results_culture[results_culture$FDR < 0.1,])


rawcounts_genotype <- rawcounts[!rownames(rawcounts) %in% ids_culture,]

group_genotype <- c("wildtype","wildtype","mutant","mutant")
dge_genotype <- DGEList(counts = rawcounts_genotype, group = group_genotype)
dge_genotype <- calcNormFactors(dge_genotype)
dge_genotype <- estimateCommonDisp(dge_genotype)
dge_genotype <- estimateTagwiseDisp(dge_genotype)
de_genotype <- exactTest(dge_genotype, pair = c("wildtype","mutant"))
results_genotype <- topTags(de_genotype, n = nrow(de_genotype))
results_genotype <- results_genotype$table
ids_genotype <- rownames(results_genotype[results_genotype$FDR < 0.1,])

de_genes_culture  <- rownames(rawcounts) %in% ids_culture
de_genes_genotype <- rownames(rawcounts) %in% ids_genotype

pseudocounts <- data.frame(rownames(rawcounts), WildType_P = log10(dge_culture$pseudo.counts[,1]), WildType_B = log10(dge_culture$pseudo.counts[,2]), Mutant_P =  log10(dge_culture$pseudo.counts[,3]), Mutant_B = log10(dge_culture$pseudo.counts[,4]), DE_C = de_genes_culture, DE_G = de_genes_genotype, row.names = 1)

#Medio de Cultivo
pdf(file=file.path(output_pseudo,"pair_expression_culture.pdf"), width = 8, height = 4)
par(mfrow = c(1,2))
plot(pseudocounts$WildType_P, pseudocounts$WildType_B, col = ifelse(pseudocounts$DE_C, "red", "blue"), main = "Wild Type", xlab = "Planctonic", ylab = "Biofilm", cex.main = 1.3, cex.lab = 1.3, cex.axis = 1.2, las = 01)
abline(lsfit(pseudocounts$WildType_P, pseudocounts$WildType_B), col = "black")
plot(pseudocounts$Mutant_P, pseudocounts$Mutant_B, col = ifelse(pseudocounts$DE_C, "red", "blue"), main = "Mutant", xlab = "Planctonic", ylab =  "Biofilm", cex.main = 1.3, cex.lab = 1.3, cex.axis = 1.2, las = 01)
abline(lsfit(pseudocounts$Mutant_P, pseudocounts$Mutant_B), col = "black")
dev.off()

#Genotipo
pdf(file=file.path(output_pseudo,"pair_expression_genotype.pdf"), width = 8, height = 4)
par(mfrow = c(1,2))
plot(pseudocounts$WildType_P, pseudocounts$Mutant_P, col = ifelse(pseudocounts$DE_G, "red", "blue"), main = "Planctonic", xlab = "Wild Type", ylab = "Mutant", cex.main = 1.3, cex.lab = 1.3, cex.axis = 1.2, las = 01)
abline(lsfit(pseudocounts$WildType_P, pseudocounts$Mutant_P), col = "black")
plot(pseudocounts$WildType_B, pseudocounts$Mutant_B, col = ifelse(pseudocounts$DE_G, "red", "blue"), main = "Biofilm", xlab = "Wild Type", ylab = "Mutant", cex.main = 1.3, cex.lab = 1.3, cex.axis = 1.2, las = 01)
abline(lsfit(pseudocounts$WildType_B, pseudocounts$Mutant_B), col = "black")
dev.off()


pdf(file=file.path(output_histogram,"histograms_pvalue.pdf"), width = 8, height = 4)
par(mfrow = c(1,2))
hist(x = results_culture$PValue, col = "skyblue", border = "blue", main = "Culture", xlab = "P-value", ylab = "Frequency", cex.main = 1.3, cex.lab = 1.3, cex.axis = 1.2)
hist(x = results_genotype$PValue, col = "skyblue", border = "blue", main = "Genotype", xlab = "P-value", ylab = "Frequency", cex.main = 1.3, cex.lab = 1.3, cex.axis = 1.2)
dev.off()


pdf(file=file.path(output_pvalue_fdr, "pvalue_fdr.pdf"), width = 8, height = 4)
par(mfrow = c(1,2))
plot(results_culture$PValue, results_culture$FDR, col = "blue", main = "Culture", xlab = "P-value", ylab = "FDR", cex.main = 1.3, cex.lab = 1.3, cex.axis = 1.2, las = 01)
plot(results_genotype$PValue, results_genotype$FDR, col = "blue", main = "Genotype", xlab = "P-value", ylab = "FDR", cex.main = 1.3, cex.lab = 1.3, cex.axis = 1.2, las = 01)
dev.off()

#Medio de Cultivo
write.table(x=results_culture, file=file.path(output_table, "table_de_genes_culture.csv"), quote=F, sep="\t", dec=".", row.names=T, col.names=T)
#Genotipo
write.table(x=results_genotype, file=file.path(output_table, "table_de_genes_genotype.csv"), quote=F, sep="\t", dec=".", row.names=T, col.names=T)


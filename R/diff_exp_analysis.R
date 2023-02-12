# Load requiered packages
library('edgeR')
# Load the rse
load('data/rse_gene_SRP081192.RData')
# Expand sra satributes
rse_gene_SRP081192 <- expand_sra_attributes(rse_gene_SRP081192)

# Assign groups isolate to a new column in colData
rse_gene_SRP081192$sample <- factor(rse_gene_SRP081192$sra_attribute.isolate)

# Make control quality assessment of samples

rse_gene_SRP081192$assigned_gene_prop <- rse_gene_SRP081192$recount_qc.gene_fc_count_all.assigned/rse_gene_SRP081192$recount_qc.gene_fc_count_all.total
summary(rse_gene_SRP081192$assigned_gene_prop)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
# 0.7106  0.7245  0.7270  0.7248  0.7291  0.7305

# Visualize low quality samples (all samples are of high quality)
hist(rse_gene_SRP081192$assigned_gene_prop, main = 'Assigned gene proportion', xlab = 'assigned gene prop')

# Check genes mean expression
gene_means <- rowMeans(assay(rse_gene_SRP081192, "counts"))
summary(gene_means)
#Min.  1st Qu.   Median     Mean  3rd Qu.     Max.
#0.0      0.0      1.8    427.0    170.5 444796.5

# Eliminate genes
rse_gene_SRP081192_unfiltered <- rse_gene_SRP081192
rse_gene_SRP081192 <- rse_gene_SRP081192_unfiltered[gene_means>0.1,]

# Calculate number of genes filtered
round(nrow(rse_gene_SRP081192)/nrow(rse_gene_SRP081192_unfiltered)*100, 2)
# 68.96




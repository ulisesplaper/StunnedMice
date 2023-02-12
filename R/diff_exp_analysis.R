# Load the rse
load('data/rse_gene_SRP009615.RData')

# Make control quality assessment of samples

rse_gene_SRP009615$assigned_gene_prop <- rse_gene_SRP009615$recount_qc.gene_fc_count_all.assigned/rse_gene_SRP009615$recount_qc.gene_fc_count_all.total
summary(rse_gene_SRP009615$assigned_gene_prop)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
# 0.7106  0.7245  0.7270  0.7248  0.7291  0.7305

# Visualize low quality samples (all samples are of high quality)
hist(rse_gene_SRP009615$assigned_gene_prop, main = 'Assigned gene proportion', xlab = 'assigned gene prop')




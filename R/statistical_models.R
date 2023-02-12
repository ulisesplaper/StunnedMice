# Load libraries
library('recount3')
library('limma')

## load the RSE

load('data/rse_gene_SRP009615.RData')

# Expand the rse object atributes
rse_gene_SRP009615 <- expand_sra_attributes(rse_gene_SRP009615)



# Explore the atributes
colData(rse_gene_SRP009615)[
  ,
  grepl("^sra_attribute", colnames(colData(rse_gene_SRP009615)))
]

# Visualize the design for generate statistics model
# In this case, only one factor contribute to the design,
# so this step can be omitted
sampleData <- data.frame(sra_attribute.isolate = factor(rse_gene_SRP009615$sra_attribute.isolate))
sampleData

vd <- ExploreModelMatrix::VisualizeDesign(
  sampleData = sampleData,
  designFormula = ~ sra_attribute.isolate,
  textSizeFitted = 4
)
cowplot::plot_grid(plotlist = vd$plotlist)


# Generate matrix for all pairwise comparisons
contrastMatrix <- makeContrasts(Dex24h-Control24h, Dex24h-Dex12h,Dex24h-Noise, Dex12h-Control12h,
                           Dex12h-Noise, Noise-Baseline, levels = rse_gene_SRP009615$sra_attribute.isolate)
# Save the design matrix as Rdata file
save(contrastMatrix, file = 'data/contrastMatrix.RData')



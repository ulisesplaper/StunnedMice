## Download experiment data and generate
# RangeSummarizedObject

# Import packages
library("recount3")


## Current url
getOption(
  "recount3_url",
  "http://duffel.rail.bio/recount3"
)

## Change URL
options(recount3_url = "https://recount-opendata.s3.amazonaws.com/recount3/release")

## Check changes.
getOption(
  "recount3_url",
  "http://duffel.rail.bio/recount3"
)

## Check mouse projects
mouse_projects <- available_projects(organism = 'mouse')
mouse_projects

## Find project of interest
proj_info <- subset(
  mouse_projects,
  project == "SRP081192" & project_type == "data_sources"
)
## Create RangedSummarizedExperiment (RSE) object
## with project info
## con la información a nivel de genes
rse_gene_SRP009615 <- create_rse(proj_info)

# Explore RSE
rse_gene_SRP009615

#Scale coverage counts
assay(rse_gene_SRP009615) <- compute_read_counts(rse_gene_SRP009615)

# Save the scaled rse
save(rse_gene_SRP009615, file = 'rse_gene_SRP009615.RData')

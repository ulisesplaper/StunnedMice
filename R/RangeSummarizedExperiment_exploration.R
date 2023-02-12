#libraries imports
library("iSEE")

#Load de RSE obj
load('data/rse_gene_SRP009615.RData')

rse_gene_SRP009615[dim]

#Dimension or the rse
dim(rse_gene_SRP009615)
# 55421     6

# get assay names
assayNames(rse_gene_SRP009615)

# Sample atributes
rse_gene_SRP009615$sra.sample_attributes
# [1] "age;;6weeks|BioSampleModel;;Model organism or animal|isolate;;Control12h|sex;;female|strain;;C57BL/6|tissue;;cochlea"
# [2] "age;;6weeks|BioSampleModel;;Model organism or animal|isolate;;Dex24h|sex;;female|strain;;C57BL/6|tissue;;cochlea"
# [3] "age;;6weeks|BioSampleModel;;Model organism or animal|isolate;;Control24h|sex;;female|strain;;C57BL/6|tissue;;cochlea"
# [4] "age;;6weeks|BioSampleModel;;Model organism or animal|isolate;;Baseline|sex;;female|strain;;C57BL/6|tissue;;cochlea"
# [5] "age;;6weeks|BioSampleModel;;Model organism or animal|isolate;;Noise|sex;;female|strain;;C57BL/6|tissue;;cochlea"
# [6] "age;;6weeks|BioSampleModel;;Model organism or animal|isolate;;Dex12h|sex;;female|strain;;C57BL/6|tissue;;cochlea"

#Sample description
rse_gene_SRP009615$sra.sample_description
#[1] "Mice were exposed to intense noise for 2h. Immediately following noise exposure, control saline was intraperitoneally injected. At 12h following the noise exposure, mice were deeply anesthetized and the cochlear tissue was dissected in RNA later (Qiagen, Valencia, CA)  (6 mice)."
#[2] "Mice were exposed to intense noise for 2h. Immediately following noise exposure, dexamethasone sodium triphosphate (10mg/kg) was intraperitoneally injected. At 24h following the noise exposure and dexamethasone administration, mice were deeply anesthetized and the cochlear tissue was dissected in RNA later (Qiagen, Valencia, CA)  (6 mice)."
#[3] "Mice were exposed to intense noise for 2h. Immediately following noise exposure, control saline was intraperitoneally injected. At 24h following the noise exposure, mice were deeply anesthetized and the cochlear tissue was dissected in RNA later (Qiagen, Valencia, CA)  (6 mice)."
#[4] "Mice were deeply anesthetized and the cochlear tissue was dissected in RNA later (Qiagen, Valencia, CA) (6 mice)."
#[5] "Mice were exposed to intense noise for 2h. At 12h following the noise exposure, mice were deeply anesthetized and the cochlear tissue was dissected in RNA later (Qiagen, Valencia, CA)  (6 mice)."

# Look at the row info
rowRanges(rse_gene_SRP009615)

# Look at the column info
colData(rse_gene_SRP009615)

#Visualize interactively the rse obj
iSEE::iSEE(rse_gene_SRP009615)

rse_gene_SRP009615$sra.experiment_title

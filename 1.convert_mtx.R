library(Matrix);library(Seurat)

##load R object of seu_obj's exprMatrix and meta.data
setwd(".")
metaFile <- readRDS("seurat.metaData.rds")
counts <- readRDS("seurat.rnacounts.rds")
##convert to coo_matrix
coo_matrix <- Matrix(counts, sparse = T ) 
##write out Matrix file of sparse
setwd(".")
writeMM(obj = coo_matrix, file="scRNA_matrix.mtx");system("gzip scRNA_matrix.mtx")
write(x = coo_matrix@Dimnames[[1]], file = "scRNA_features.tsv")
write.table(metaFile, file = 'scRNA_meta.tsv', sep = '\t', quote = FALSE)

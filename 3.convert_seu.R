library(Seurat)
#load matrix to bulid seu_obj
counts <- Matrix::readMM("scRNA_matrix.mtx.gz")
feature.names <- readLines("scRNA_features.tsv")
metadata <- read.table("scRNA_meta.tsv",sep="\t",header=T)
colnames(counts) <- rownames(metadata)
rownames(counts) <- feature.names
scRNA <- CreateSeuratObject(counts = counts,meta.data = metadata)
#save R object
setwd(".")
saveRDS(scRNA,"seu_sc.rds")

library(tidyverse)
library(Seurat)
library(GSVA)
library(rstatix)
library(data.table)
library(harmony)
library(patchwork)
library(msigdbr)
library(descr)

whole <- readRDS("tmp/whole.rds")

whole <- RunHarmony(whole, group.by.vars = "sample", dims = 1:16) %>%
   RunUMAP(reduction = "harmony", dims = 1:16) %>%
   FindNeighbors(reduction = "harmony", dims = 1:16) %>%
   FindClusters(res = seq(0.05, 0.15, 0.05))

 # Select reasonable clusters

markers <- c(
    "MXD3", "PRC1", "APOD", "COL1A2", "CD79A", "IGHM",
    "KRT19", "ADIRF", "FABP4", "CD36", "FBN1", "EGFR",
    "HLA-DRA", "MS4A7", "S100A8", "FCGR3A", "CD3D", "NKG7")
p <- DoHeatmap(subset(whole, downsample = 200), features = markers, raster = TRUE, group.by = "cell_type")

# Cell proportion

CrossTable(whole$cell_type, whole$sample, prop.t = FALSE, prop.chisq = FALSE)

# Pathway analysis with your favorite tools

# Extract macrophage

macrophage <- subset(whole, idents = c("macrophages"))

# Macrophage subset re-analysis

macrophage@meta.data <- select(macropage@meta.data, -startsWith("RNA_snn_res."))
macrophage <- RunHarmony(whole, group.by.vars = "sample", dims = 1:16) %>%
   RunUMAP(reduction = "harmony", dims = 1:16) %>%
   FindNeighbors(reduction = "harmony", dims = 1:16) %>%
   FindClusters(res = seq(0.05, 0.15, 0.05))

# WGCNA analysis

library(WGCNA)

powers <- c(c(1:10), seq(from = 12, to=30, by=2))
sft <- pickSoftThreshold(dataExpr, powerVector=powers, 
                        networkType="signed", verbose=5)
net <- blockwiseModules(
  macrophage@assays$RNA@data,
  power = power,
  maxBlockSize, minModulesize, mergeCutHeight = 0.25,
                       numericLabels = TRUE, pamRespectsDendro = FALSE,
                       saveTOMs=TRUE, corType = corType, 
                       maxPOutliers=maxPOutliers, loadTOMs=TRUE,
                       saveTOMFileBase = paste0("dataExpr", ".tom"),
                       verbose = 3
)



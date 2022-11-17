library(tidyverse)
library(Seurat)

samples <- list.dirs("data", recursive = FALSE)
load_data <- function(s) {
    sample <- str_extract(s, "[A-Z]+\\d{2,3}")
    cat(paste0("Loading: ", sample, "\n"))
    group <- str_extract(sample, "[A-Z]+(?=[0-9]*)")
    path <- paste0("~/bioresource/SVF_dataset/data/", sample, "/")
    doublets <- read_csv(paste0(path, "doublets_barcodes.csv"), show_col_types = FALSE) %>% filter(!doubletdetection_doublets)
    srt_obj <- CreateSeuratObject(
        counts = Read10X(data.dir = paste0(path, "mtx")),
        project = "SVF",
        assay = "RNA",
        min.cells = 5,
        min.features = 200) %>% subset(., subset = HBB == 0 & HBA2 == 0) %>% subset(., cells = doublets$barcode)
    srt_obj[["group"]] <- rep(group, ncol(srt_obj))
    srt_obj[["sample"]] <- rep(sample, ncol(srt_obj))
    srt_obj[["percent.mt"]] <- PercentageFeatureSet(srt_obj, pattern = "^MT-")
    srt_obj[["percent.hb"]] <- PercentageFeatureSet(srt_obj, pattern = "^HB-")
    srt_obj <- RenameCells(srt_obj, add.cell.id = sample)
    srt_obj <- subset(
        srt_obj,
        nFeature_RNA > 200 &
        nCount_RNA < 40000 &
        nCount_RNA > 300 &
        percent.hb < 20 &
        percent.mt < 10)
}
srt_lst <- lapply(samples, load_data)
saveRDS(srt_lst, "tmp/raw_whole.rds")

whole <- reduce(srt_lst, merge)
rm(srt_lst)
gc()
whole <- whole %>%
    NormalizeData()
whole <- FindVariableFeatures(whole, selection.method = "vst", nfeatures = 2000)
whole <- ScaleData(whole, features = rownames(whole))
gc()
whole <- RunPCA(whole, features = VariableFeatures(whole))
ElbowPlot(whole)

# Run downstream analysis as you like.
saveRDS(whole, "tmp/whole.rds")

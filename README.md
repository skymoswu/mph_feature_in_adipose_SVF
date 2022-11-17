# Phagocytic Macrophages in Human Visceral Adipose Tissue Regulate Lipid-Buffering and Associated with Type 2 Diabetes Mellitus

## Data Accessibility

Our data has been uploaded to Genome Sequence Archive for Human with accession number: HRA002549.

## Session Info

```R
R version 4.2.2 (2022-10-31)
Platform: x86_64-suse-linux-gnu (64-bit)
Running under: openSUSE Tumbleweed

Matrix products: default
BLAS:   /usr/lib64/R/lib/libRblas.so
LAPACK: /usr/lib64/R/lib/libRlapack.so

locale:
 [1] LC_CTYPE=zh_CN.UTF-8       LC_NUMERIC=C              
 [3] LC_TIME=zh_CN.UTF-8        LC_COLLATE=zh_CN.UTF-8    
 [5] LC_MONETARY=zh_CN.UTF-8    LC_MESSAGES=zh_CN.UTF-8   
 [7] LC_PAPER=zh_CN.UTF-8       LC_NAME=C                 
 [9] LC_ADDRESS=C               LC_TELEPHONE=C            
[11] LC_MEASUREMENT=zh_CN.UTF-8 LC_IDENTIFICATION=C       

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] descr_1.1.5        msigdbr_7.5.1      patchwork_1.1.2    harmony_0.1.0     
 [5] Rcpp_1.0.9         data.table_1.14.4  rstatix_0.7.1      GSVA_1.44.5       
 [9] SeuratObject_4.1.3 Seurat_4.2.1       forcats_0.5.2      stringr_1.4.1     
[13] dplyr_1.0.10       purrr_0.3.5        readr_2.1.3        tidyr_1.2.1       
[17] tibble_3.1.8       ggplot2_3.4.0      tidyverse_1.3.2   

loaded via a namespace (and not attached):
  [1] utf8_1.2.2                  spatstat.explore_3.0-5     
  [3] reticulate_1.26             tidyselect_1.2.0           
  [5] RSQLite_2.2.18              AnnotationDbi_1.58.0       
  [7] htmlwidgets_1.5.4           grid_4.2.2                 
  [9] BiocParallel_1.30.4         Rtsne_0.16                 
 [11] ScaledMatrix_1.4.1          munsell_0.5.0              
 [13] codetools_0.2-18            ica_1.0-3                  
 [15] pbdZMQ_0.3-8                future_1.29.0              
 [17] miniUI_0.1.1.1              withr_2.5.0                
 [19] spatstat.random_3.0-1       colorspace_2.0-3           
 [21] progressr_0.11.0            Biobase_2.56.0             
 [23] uuid_1.1-0                  stats4_4.2.2               
 [25] SingleCellExperiment_1.18.1 ROCR_1.0-11                
 [27] tensor_1.5                  listenv_0.8.0              
 [29] MatrixGenerics_1.8.1        repr_1.1.4                 
 [31] GenomeInfoDbData_1.2.8      polyclip_1.10-4            
 [33] bit64_4.0.5                 rhdf5_2.40.0               
 [35] parallelly_1.32.1           vctrs_0.5.0                
 [37] generics_0.1.3              timechange_0.1.1           
 [39] R6_2.5.1                    GenomeInfoDb_1.32.4        
 [41] rsvd_1.0.5                  bitops_1.0-7               
 [43] rhdf5filters_1.8.0          spatstat.utils_3.0-1       
 [45] cachem_1.0.6                DelayedArray_0.22.0        
 [47] assertthat_0.2.1            promises_1.2.0.1           
 [49] scales_1.2.1                googlesheets4_1.0.1        
 [51] gtable_0.3.1                beachmat_2.12.0            
 [53] globals_0.16.1              goftest_1.2-3              
 [55] rlang_1.0.6                 splines_4.2.2              
 [57] lazyeval_0.2.2              gargle_1.2.1               
 [59] spatstat.geom_3.0-3         broom_1.0.1                
 [61] reshape2_1.4.4              abind_1.4-5                
 [63] modelr_0.1.10               backports_1.4.1            
 [65] httpuv_1.6.6                tools_4.2.2                
 [67] ellipsis_0.3.2              RColorBrewer_1.1-3         
 [69] BiocGenerics_0.42.0         ggridges_0.5.4             
 [71] plyr_1.8.8                  base64enc_0.1-3            
 [73] sparseMatrixStats_1.8.0     zlibbioc_1.42.0            
 [75] RCurl_1.98-1.7              deldir_1.0-6               
 [77] pbapply_1.5-0               cowplot_1.1.1              
 [79] S4Vectors_0.34.0            zoo_1.8-11                 
 [81] SummarizedExperiment_1.26.1 haven_2.5.1                
 [83] ggrepel_0.9.2               cluster_2.1.4              
 [85] fs_1.5.2                    magrittr_2.0.3             
 [87] scattermore_0.8             lmtest_0.9-40              
 [89] reprex_2.0.2                RANN_2.6.1                 
 [91] googledrive_2.0.0           fitdistrplus_1.1-8         
 [93] matrixStats_0.62.0          hms_1.1.2                  
 [95] mime_0.12                   evaluate_0.18              
 [97] xtable_1.8-4                XML_3.99-0.10              
 [99] readxl_1.4.1                IRanges_2.30.1             
[101] gridExtra_2.3               compiler_4.2.2             
[103] KernSmooth_2.23-20          crayon_1.5.2               
[105] htmltools_0.5.3             later_1.3.0                
[107] tzdb_0.3.0                  lubridate_1.9.0            
[109] DBI_1.1.3                   dbplyr_2.2.1               
[111] MASS_7.3-58.1               babelgene_22.9             
[113] car_3.1-1                   Matrix_1.5-3               
[115] cli_3.4.1                   parallel_4.2.2             
[117] igraph_1.3.2                GenomicRanges_1.48.0       
[119] pkgconfig_2.0.3             sp_1.5-1                   
[121] IRdisplay_1.1               plotly_4.10.1              
[123] spatstat.sparse_3.0-0       xml2_1.3.3                 
[125] annotate_1.74.0             XVector_0.36.0             
[127] rvest_1.0.3                 digest_0.6.30              
[129] sctransform_0.3.5           RcppAnnoy_0.0.20           
[131] graph_1.74.0                spatstat.data_3.0-0        
[133] Biostrings_2.64.1           cellranger_1.1.0           
[135] leiden_0.4.3                uwot_0.1.14                
[137] DelayedMatrixStats_1.18.2   GSEABase_1.58.0            
[139] shiny_1.7.3                 lifecycle_1.0.3            
[141] nlme_3.1-160                jsonlite_1.8.3             
[143] Rhdf5lib_1.18.2             carData_3.0-5              
[145] viridisLite_0.4.1           fansi_1.0.3                
[147] pillar_1.8.1                lattice_0.20-45            
[149] KEGGREST_1.36.3             fastmap_1.1.0              
[151] httr_1.4.4                  survival_3.4-0             
[153] glue_1.6.2                  png_0.1-7                  
[155] bit_4.0.4                   stringi_1.7.8              
[157] HDF5Array_1.24.2            blob_1.2.3                 
[159] BiocSingular_1.12.0         memoise_2.0.1              
[161] IRkernel_1.3.1              irlba_2.3.5.1              
[163] future.apply_1.10.0
```

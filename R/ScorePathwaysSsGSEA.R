#' Score Pathways Using ssGSEA
#'
#' Calculates pathway enrichment scores for a Seurat object using ssGSEA (single sample Gene Set 
#' Enrichment Analysis). ssGSEA is a non-parametric method that calculates a separate enrichment 
#' score for each sample and pathway.
#'
#' @param seuratObject A Seurat object containing gene expression data
#' @param pathwayList A named list of pathways, where each element is a list containing 'name', 
#'   'description', and 'genes' (character vector). If NULL, uses the built-in pathways database.
#' @param assay Character string specifying which assay to use from the Seurat object. 
#'   Default is "RNA".
#' @param minSize Minimum number of genes required for a pathway to be scored. Default is 5.
#' @param maxSize Maximum number of genes allowed for a pathway to be scored. Default is 500.
#' @param normalize Logical indicating whether to normalize enrichment scores. Default is TRUE.
#' @param verbose Logical indicating whether to display progress messages. Default is TRUE.
#'
#' @return A Seurat object with pathway scores added as metadata columns. Each pathway score
#'   is added with the column name matching the pathway ID.
#'
#' @details
#' The function uses the GSVA package with method = "ssgsea" to calculate single-sample 
#' enrichment scores. Unlike traditional GSEA which requires multiple samples for comparison,
#' ssGSEA calculates enrichment scores for each sample independently, making it suitable for
#' single-cell or bulk RNA-seq data.
#'
#' The enrichment score represents the degree to which genes in a pathway are coordinately
#' up- or down-regulated within a sample. Scores are normalized by default to facilitate
#' comparison across pathways.
#'
#' Pathways are filtered based on the minSize and maxSize parameters to ensure robust scoring.
#' Only genes present in the expression matrix are used for scoring.
#'
#' @examples
#' \dontrun{
#' # Score using default pathways
#' seurat_obj <- ScorePathwaysSsGSEA(seurat_obj)
#'
#' # Score using custom pathways without normalization
#' custom_pathways <- list(
#'   my_pathway = list(
#'     name = "My Custom Pathway",
#'     description = "Description of my pathway",
#'     genes = c("GENE1", "GENE2", "GENE3")
#'   )
#' )
#' seurat_obj <- ScorePathwaysSsGSEA(seurat_obj, 
#'                                     pathwayList = custom_pathways, 
#'                                     normalize = FALSE)
#' }
#'
#' @export
#' @importFrom GSVA gsva
#' @importFrom Seurat GetAssayData AddMetaData
ScorePathwaysSsGSEA <- function(seuratObject,
                                 pathwayList = NULL,
                                 assay = "RNA",
                                 minSize = 5,
                                 maxSize = 500,
                                 normalize = TRUE,
                                 verbose = TRUE) {
  
  # Load built-in pathways if not provided
  if (is.null(pathwayList)) {
    if (verbose) message("Using built-in pathways database")
    pathwayList <- ImmunoPathwayR::pathways
  }
  
  # Extract expression matrix from Seurat object
  if (verbose) message("Extracting expression data from Seurat object")
  expr_matrix <- Seurat::GetAssayData(seuratObject, slot = "data", assay = assay)
  
  # Convert pathways to gene set list format (list of character vectors)
  if (verbose) message("Preparing pathway gene sets")
  gene_sets <- lapply(pathwayList, function(pathway) {
    pathway$genes
  })
  names(gene_sets) <- names(pathwayList)
  
  # Filter pathways by size
  gene_set_sizes <- sapply(gene_sets, length)
  valid_sets <- gene_set_sizes >= minSize & gene_set_sizes <= maxSize
  
  if (sum(valid_sets) == 0) {
    stop("No pathways meet the size criteria (minSize = ", minSize, ", maxSize = ", maxSize, ")")
  }
  
  gene_sets <- gene_sets[valid_sets]
  
  if (verbose) {
    message(sprintf("Scoring %d pathways (filtered from %d based on size)", 
                    sum(valid_sets), length(pathwayList)))
  }
  
  # Run ssGSEA via GSVA package
  if (verbose) message("Running ssGSEA analysis...")
  ssgsea_scores <- GSVA::gsva(
    expr = as.matrix(expr_matrix),
    gset.idx.list = gene_sets,
    method = "ssgsea",
    ssgsea.norm = normalize,
    min.sz = minSize,
    max.sz = maxSize,
    verbose = verbose
  )
  
  # Transpose to get cells as rows, pathways as columns
  ssgsea_scores_t <- t(ssgsea_scores)
  
  # Add scores to Seurat object metadata
  if (verbose) message("Adding pathway scores to Seurat object metadata")
  seuratObject <- Seurat::AddMetaData(
    object = seuratObject,
    metadata = as.data.frame(ssgsea_scores_t)
  )
  
  if (verbose) message("Done! Pathway scores added to metadata")
  
  return(seuratObject)
}

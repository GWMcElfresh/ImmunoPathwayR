# Basic Usage Examples for ImmunoPathwayR
# ========================================

library(ImmunoPathwayR)
library(Seurat)

# Example 1: List available pathways
# -----------------------------------
cat("\n=== Example 1: List Available Pathways ===\n")
ListPathways()

# Example 2: Examine a specific pathway
# --------------------------------------
cat("\n=== Example 2: Examine Neutrophil Chemotaxis Pathway ===\n")
cat("Pathway name:", pathways$neutrophil_chemotaxis$name, "\n")
cat("Description:", pathways$neutrophil_chemotaxis$description, "\n")
cat("Genes:", paste(pathways$neutrophil_chemotaxis$genes, collapse = ", "), "\n")

# Example 3: Score pathways using GSVA (requires a Seurat object)
# ----------------------------------------------------------------
# Assuming you have a Seurat object named 'seurat_obj':
# 
# seurat_obj <- ScorePathwaysGSVA(seurat_obj)
#
# # View the new metadata columns
# head(seurat_obj@meta.data)
#
# # Visualize a specific pathway score
# library(ggplot2)
# FeaturePlot(seurat_obj, features = "neutrophil_chemotaxis")

# Example 4: Score pathways using ssGSEA (requires a Seurat object)
# ------------------------------------------------------------------
# seurat_obj <- ScorePathwaysSsGSEA(seurat_obj)

# Example 5: Use custom pathways
# -------------------------------
customPathways <- list(
  my_custom_pathway = list(
    name = "My Custom Immune Pathway",
    description = "Example custom pathway with hand-picked genes",
    genes = c("CD3D", "CD3E", "CD3G", "CD4", "CD8A", "CD8B")
  ),
  another_pathway = list(
    name = "Another Custom Pathway",
    description = "Additional example pathway",
    genes = c("IL2", "IL4", "IL6", "IL10", "IFNG", "TNF")
  )
)

# Score with custom pathways:
# seurat_obj <- ScorePathwaysGSVA(seurat_obj, pathwayList = customPathways)

# Example 6: Adjust scoring parameters
# -------------------------------------
# Use Poisson kernel for count data:
# seurat_obj <- ScorePathwaysGSVA(
#   seurat_obj,
#   kcdf = "Poisson",
#   minSize = 3,
#   maxSize = 200
# )

# Use ssGSEA without normalization:
# seurat_obj <- ScorePathwaysSsGSEA(
#   seurat_obj,
#   normalize = FALSE,
#   minSize = 3
# )

# Example 7: Access pathway information programmatically
# -------------------------------------------------------
cat("\n=== Example 7: Pathway Statistics ===\n")
pathway_info <- ListPathways(verbose = FALSE)
cat("Total pathways:", nrow(pathway_info), "\n")
cat("Average genes per pathway:", mean(pathway_info$n_genes), "\n")
cat("Smallest pathway:", 
    pathway_info$name[which.min(pathway_info$n_genes)], 
    "(", min(pathway_info$n_genes), "genes )\n")
cat("Largest pathway:", 
    pathway_info$name[which.max(pathway_info$n_genes)], 
    "(", max(pathway_info$n_genes), "genes )\n")

# Example 8: Extending the database
# ----------------------------------
cat("\n=== Example 8: Add Custom Pathways to Built-in Database ===\n")

# Combine built-in and custom pathways
extendedPathways <- c(pathways, customPathways)
cat("Original pathways:", length(pathways), "\n")
cat("Extended pathways:", length(extendedPathways), "\n")

# Use extended set for scoring:
# seurat_obj <- ScorePathwaysGSVA(seurat_obj, pathwayList = extendedPathways)

cat("\n=== Examples Complete ===\n")
cat("For more information, see: ?ScorePathwaysGSVA and ?ScorePathwaysSsGSEA\n")

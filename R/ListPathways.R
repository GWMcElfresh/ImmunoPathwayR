#' List Available Pathways
#'
#' Returns a summary of available pathways in the database, including their names,
#' descriptions, and number of genes.
#'
#' @param pathwayList A named list of pathways. If NULL, uses the built-in pathways database.
#' @param verbose Logical indicating whether to print the summary. Default is TRUE.
#'
#' @return A data frame with columns: pathway_id, name, description, and n_genes
#'
#' @examples
#' # List all built-in pathways
#' ListPathways()
#'
#' # Get pathway information as a data frame without printing
#' pathway_info <- ListPathways(verbose = FALSE)
#'
#' @export
ListPathways <- function(pathwayList = NULL, verbose = TRUE) {
  
  # Load built-in pathways if not provided
  if (is.null(pathwayList)) {
    pathwayList <- ImmunoPathwayR::pathways
  }
  
  # Create summary data frame
  pathway_summary <- data.frame(
    pathway_id = names(pathwayList),
    name = sapply(pathwayList, function(x) x$name),
    description = sapply(pathwayList, function(x) x$description),
    n_genes = sapply(pathwayList, function(x) length(x$genes)),
    stringsAsFactors = FALSE,
    row.names = NULL
  )
  
  if (verbose) {
    cat("\nAvailable Pathways:\n")
    cat("==================\n\n")
    for (i in seq_len(nrow(pathway_summary))) {
      cat(sprintf("%d. %s (%d genes)\n", i, 
                  pathway_summary$name[i], 
                  pathway_summary$n_genes[i]))
      cat(sprintf("   ID: %s\n", pathway_summary$pathway_id[i]))
      cat(sprintf("   Description: %s\n\n", pathway_summary$description[i]))
    }
    cat(sprintf("Total: %d pathways\n", nrow(pathway_summary)))
  }
  
  invisible(pathway_summary)
}

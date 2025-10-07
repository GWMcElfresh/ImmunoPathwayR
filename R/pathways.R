#' Curated Immune Pathways Database
#'
#' A curated list of immune-related pathways with specific genes for each biological process.
#' This database uses a "bottom-up" approach, focusing on specific, clearly annotated pathways
#' with reduced redundancy compared to comprehensive databases.
#'
#' @format A named list where each element represents a pathway and contains:
#' \describe{
#'   \item{name}{Character string with the human-readable pathway name}
#'   \item{description}{Character string with a clear annotation of the pathway}
#'   \item{genes}{Character vector of gene symbols associated with the pathway}
#' }
#'
#' @details
#' The pathways database includes various categories of immune processes:
#' \itemize{
#'   \item Chemotaxis and Migration: neutrophil, monocyte, and T cell recruitment
#'   \item Cellular Activation: T cell, B cell, and macrophage activation states
#'   \item Cytotoxicity: NK and CD8 T cell effector functions
#'   \item Cytokines: pro-inflammatory, anti-inflammatory, and interferon responses
#'   \item Complement System: complement activation components
#'   \item Antigen Presentation: MHC class I and II pathways
#'   \item Cell Death: apoptosis and pyroptosis
#'   \item T Cell Subsets: Th1, Th2, Th17, and Treg responses
#'   \item Immune Checkpoint: inhibitory and co-stimulatory signals
#'   \item Tissue Remodeling: matrix metalloproteinases and remodeling factors
#'   \item Oxidative Stress: reactive oxygen species and antioxidant response
#' }
#'
#' Each pathway is designed to be relatively non-redundant, though some genes may appear
#' in multiple pathways when they participate in different biological processes.
#'
#' @examples
#' # View all pathway names
#' names(pathways)
#'
#' # View a specific pathway
#' pathways$neutrophil_chemotaxis
#'
#' # Get genes for T cell activation
#' pathways$t_cell_activation$genes
#'
#' @export
"pathways"

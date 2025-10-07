# ImmunoPathwayR

A reductionist, semi-curated pathway database for scoring immune gene expression data.

## Overview

ImmunoPathwayR provides:
- **Curated immune pathways**: Bottom-up, clearly annotated pathways with specific genes (e.g., "Neutrophil Chemotaxis - CCL2, CXCL8, CXCL1")
- **GSVA scoring**: Gene Set Variation Analysis for pathway enrichment
- **ssGSEA scoring**: Single sample Gene Set Enrichment Analysis
- **Seurat integration**: Functions designed to work directly with Seurat objects

The pathways are designed to be less correlated than comprehensive databases, focusing on specific biological processes with clear gene annotations.

## Installation

```r
# Install from GitHub
# install.packages("devtools")
devtools::install_github("GWMcElfresh/ImmunoPathwayR")
```

## Usage

### Basic Usage with GSVA

```r
library(ImmunoPathwayR)
library(Seurat)

# Score pathways using GSVA
seurat_obj <- ScorePathwaysGSVA(seurat_obj)

# Access pathway scores in metadata
head(seurat_obj@meta.data)
```

### Basic Usage with ssGSEA

```r
# Score pathways using ssGSEA
seurat_obj <- ScorePathwaysSsGSEA(seurat_obj)
```

### Custom Pathways

```r
# Define custom pathways
customPathways <- list(
  my_pathway = list(
    name = "My Custom Pathway",
    description = "Description of what this pathway represents",
    genes = c("GENE1", "GENE2", "GENE3", "GENE4")
  )
)

# Score with custom pathways
seurat_obj <- ScorePathwaysGSVA(seurat_obj, pathwayList = customPathways)
```

### Exploring the Pathway Database

```r
# View all available pathways
names(pathways)

# View a specific pathway
pathways$neutrophil_chemotaxis

# Get genes for a pathway
pathways$t_cell_activation$genes
```

## Available Pathways

The database includes pathways for:

- **Chemotaxis & Migration**: Neutrophil, monocyte, and T cell recruitment
- **Cellular Activation**: T cell, B cell, M1/M2 macrophage activation
- **Cytotoxicity**: NK cell and CD8 T cell effector functions
- **Cytokines**: Pro-inflammatory, anti-inflammatory, Type I/II interferon
- **Complement System**: Complement activation components
- **Antigen Presentation**: MHC class I and II pathways
- **Cell Death**: Apoptosis and pyroptosis
- **T Cell Subsets**: Th1, Th2, Th17, and Treg responses
- **Immune Checkpoint**: Inhibitory and co-stimulatory molecules
- **Tissue Remodeling**: Matrix metalloproteinases
- **Oxidative Stress**: ROS and antioxidant responses

## Function Reference

### ScorePathwaysGSVA

Scores gene expression using GSVA methodology.

**Parameters:**
- `seuratObject`: Seurat object with expression data
- `pathwayList`: Custom pathways (default: built-in pathways)
- `assay`: Assay to use (default: "RNA")
- `minSize`: Minimum pathway size (default: 5)
- `maxSize`: Maximum pathway size (default: 500)
- `method`: GSVA method (default: "gsva")
- `kcdf`: Kernel type (default: "Gaussian")
- `verbose`: Show progress (default: TRUE)

### ScorePathwaysSsGSEA

Scores gene expression using ssGSEA methodology.

**Parameters:**
- `seuratObject`: Seurat object with expression data
- `pathwayList`: Custom pathways (default: built-in pathways)
- `assay`: Assay to use (default: "RNA")
- `minSize`: Minimum pathway size (default: 5)
- `maxSize`: Maximum pathway size (default: 500)
- `normalize`: Normalize scores (default: TRUE)
- `verbose`: Show progress (default: TRUE)

## Naming Conventions

- **Functions**: PascalCase (e.g., `ScorePathwaysGSVA`)
- **Internal variables**: snake_case (e.g., `expr_matrix`)
- **External variables/parameters**: camelCase (e.g., `seuratObject`)

## License

GPL-3 

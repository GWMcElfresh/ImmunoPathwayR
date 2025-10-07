# Contributing to ImmunoPathwayR

Thank you for your interest in contributing to ImmunoPathwayR! This guide will help you add new pathways or improve existing functionality.

## Adding New Pathways

The easiest way to contribute is by adding new curated pathways to the database.

### Step 1: Edit the Pathway Database

Navigate to `data-raw/pathways.R` and add your pathway to the `pathways` list:

```r
your_pathway_id = list(
  name = "Your Pathway Name",
  description = "Clear description of what this pathway represents",
  genes = c("GENE1", "GENE2", "GENE3", "GENE4", "GENE5")
)
```

### Step 2: Follow Curation Guidelines

**Pathway ID:**
- Use `snake_case` (e.g., `neutrophil_chemotaxis`)
- Keep it concise and descriptive

**Name:**
- Use proper capitalization
- Keep it human-readable

**Description:**
- Explain the biological process
- Be specific about cell types or conditions when relevant
- Keep it clear and concise

**Genes:**
- Use official HGNC gene symbols
- Include 5-15 genes (flexible based on pathway)
- Focus on core genes with established roles
- Verify gene symbols are current

### Step 3: Regenerate the Data

```r
# From the data-raw directory
source("pathways.R")
```

This updates `data/pathways.rda`

### Step 4: Test Your Changes

```r
# Load the package locally
devtools::load_all()

# Check your pathway
pathways$your_pathway_id

# List all pathways
ListPathways()
```

### Step 5: Submit a Pull Request

1. Commit your changes
2. Push to your fork
3. Open a pull request with:
   - Description of the pathway
   - Rationale for gene selection
   - References (PMID, DOI) if applicable

## Improving Functions

### Naming Conventions

Please follow these conventions:

- **Functions**: `PascalCase` (e.g., `ScorePathwaysGSVA`)
- **Internal variables**: `snake_case` (e.g., `expr_matrix`)
- **Function parameters**: `camelCase` (e.g., `seuratObject`)

### Documentation

All functions should have:
- Roxygen2 documentation (`#'`)
- Parameter descriptions (`@param`)
- Return value description (`@return`)
- Usage examples (`@examples`)
- Appropriate exports (`@export`)

### Testing

While we don't have formal unit tests yet, please verify:
- Functions parse without errors
- Functions work with Seurat objects
- Documentation is clear and accurate

## Code Style

- Use 2 spaces for indentation
- Keep lines under 100 characters when possible
- Add comments for complex logic
- Follow existing code style in the repository

## Questions?

Open an issue if you have questions or need clarification!

## License

By contributing, you agree that your contributions will be licensed under the GPL-3 license.

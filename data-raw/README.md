# Pathway Database Curation Guide

This directory contains the source code for curating and generating the pathway database.

## File Structure

- `pathways.R`: The main script defining all pathways and generating the `pathways.rda` data file

## Adding New Pathways

To add new pathways to the database:

1. Edit `pathways.R`
2. Add your pathway to the `pathways` list following this format:

```r
your_pathway_id = list(
  name = "Human Readable Pathway Name",
  description = "Clear description of what this pathway represents",
  genes = c("GENE1", "GENE2", "GENE3", "GENE4")
)
```

### Guidelines for Pathway Curation

**Naming Convention:**
- Use snake_case for pathway IDs (e.g., `neutrophil_chemotaxis`)
- Use descriptive, readable names for the `name` field

**Description:**
- Keep descriptions clear and concise
- Explain the biological process the pathway represents
- Include context about the cell type or process when relevant

**Gene Selection:**
- Use official HGNC gene symbols (e.g., "IFNG" not "IFN-gamma")
- Focus on core genes that define the pathway
- Aim for 5-15 genes per pathway (can be flexible)
- Prioritize genes with clear, established roles
- Minimize redundancy across pathways where possible

**Bottom-Up Approach:**
- Start with specific biological processes
- Include genes with direct mechanistic roles
- Avoid overly broad or overlapping pathways
- Example: "Neutrophil Chemotaxis - CCL2, CXCL8, CXCL1" rather than "General Chemotaxis"

## Regenerating the Database

After editing `pathways.R`, regenerate the data file:

```r
# From the data-raw directory
source("pathways.R")
```

This will create/update `../data/pathways.rda`

## Pathway Categories

Current categories include:

1. **Chemotaxis & Migration**: Cell recruitment processes
2. **Cellular Activation**: Activation states of immune cells
3. **Cytotoxicity**: Killing mechanisms
4. **Cytokines**: Inflammatory signaling molecules
5. **Complement**: Complement system components
6. **Antigen Presentation**: MHC pathways
7. **Cell Death**: Apoptosis, pyroptosis
8. **T Cell Subsets**: Th1, Th2, Th17, Treg responses
9. **Immune Checkpoint**: Inhibitory and stimulatory signals
10. **Tissue Remodeling**: ECM and remodeling factors
11. **Oxidative Stress**: ROS and antioxidants

## Quality Control

Before adding pathways, verify:

- [ ] Gene symbols are current and correct
- [ ] Description is clear and informative
- [ ] Pathway size is reasonable (typically 5-15 genes)
- [ ] Limited overlap with existing pathways
- [ ] Biological rationale is sound

## Citation and References

When adding pathways based on literature, consider adding comments in the code with:
- Reference DOI or PMID
- Brief rationale for gene selection
- Date of curation

Example:
```r
# Reference: PMID:12345678
# Rationale: Core cytokines for M1 polarization based on...
macrophage_activation_m1 = list(
  name = "Macrophage M1 Activation",
  description = "Pro-inflammatory M1 macrophage polarization markers",
  genes = c("NOS2", "IL1B", "IL6", "TNF", "CXCL9", "CXCL10", "CD80", "CD86")
)
```

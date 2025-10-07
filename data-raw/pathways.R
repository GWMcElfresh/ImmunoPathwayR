# Curated Immune Pathways Database
# Bottom-up approach: specific genes for each biological process
# Format: List of pathways, where each pathway contains a named list with:
#   - name: pathway name
#   - description: clear annotation of the pathway
#   - genes: character vector of gene symbols

# Define pathways
pathways <- list(
  
  # Chemotaxis and Migration
  neutrophil_chemotaxis = list(
    name = "Neutrophil Chemotaxis",
    description = "Chemokines and receptors involved in neutrophil recruitment and migration",
    genes = c("CCL2", "CXCL8", "CXCL1", "CXCL2", "CXCL5", "CXCR1", "CXCR2")
  ),
  
  monocyte_chemotaxis = list(
    name = "Monocyte Chemotaxis",
    description = "Chemokines and receptors involved in monocyte recruitment",
    genes = c("CCL2", "CCL7", "CCL8", "CCL13", "CCR2", "CCR5", "CX3CL1", "CX3CR1")
  ),
  
  t_cell_chemotaxis = list(
    name = "T Cell Chemotaxis",
    description = "Chemokines and receptors involved in T cell recruitment",
    genes = c("CXCL9", "CXCL10", "CXCL11", "CXCR3", "CCL5", "CCR5", "CCL19", "CCL21", "CCR7")
  ),
  
  # Cellular Activation
  t_cell_activation = list(
    name = "T Cell Activation",
    description = "Core markers of T cell activation and proliferation",
    genes = c("CD69", "CD25", "IL2RA", "CD38", "HLA-DR", "ICOS", "CD137", "CD134")
  ),
  
  b_cell_activation = list(
    name = "B Cell Activation",
    description = "Markers of B cell activation and maturation",
    genes = c("CD69", "CD80", "CD86", "CD38", "TNFRSF13B", "TNFRSF17")
  ),
  
  macrophage_activation_m1 = list(
    name = "Macrophage M1 Activation",
    description = "Pro-inflammatory M1 macrophage polarization markers",
    genes = c("NOS2", "IL1B", "IL6", "TNF", "CXCL9", "CXCL10", "CD80", "CD86")
  ),
  
  macrophage_activation_m2 = list(
    name = "Macrophage M2 Activation",
    description = "Anti-inflammatory M2 macrophage polarization markers",
    genes = c("ARG1", "MRC1", "CD163", "IL10", "TGFB1", "CCL18", "CD200R1")
  ),
  
  # Cytotoxicity
  nk_cell_cytotoxicity = list(
    name = "NK Cell Cytotoxicity",
    description = "Natural killer cell cytotoxic effector molecules",
    genes = c("PRF1", "GZMA", "GZMB", "GZMH", "GNLY", "NKG7", "KLRK1", "KLRD1")
  ),
  
  cd8_t_cell_cytotoxicity = list(
    name = "CD8 T Cell Cytotoxicity",
    description = "Cytotoxic CD8+ T cell effector molecules",
    genes = c("PRF1", "GZMA", "GZMB", "IFNG", "TNF", "FASLG", "CD8A", "CD8B")
  ),
  
  # Inflammatory Cytokines
  proinflammatory_cytokines = list(
    name = "Pro-inflammatory Cytokines",
    description = "Key pro-inflammatory cytokine production",
    genes = c("IL1B", "IL6", "TNF", "IL12A", "IL12B", "IL18", "IL23A")
  ),
  
  antiinflammatory_cytokines = list(
    name = "Anti-inflammatory Cytokines",
    description = "Immunosuppressive and anti-inflammatory cytokines",
    genes = c("IL10", "TGFB1", "IL4", "IL13", "IL1RN")
  ),
  
  type_i_interferon = list(
    name = "Type I Interferon Response",
    description = "Type I interferon signaling and response genes",
    genes = c("IFNA1", "IFNB1", "ISG15", "MX1", "OAS1", "IFIT1", "IFIT2", "IFIT3")
  ),
  
  type_ii_interferon = list(
    name = "Type II Interferon Response",
    description = "IFN-gamma signaling and response genes",
    genes = c("IFNG", "STAT1", "IRF1", "CXCL9", "CXCL10", "CXCL11", "IDO1", "GBP1")
  ),
  
  # Complement System
  complement_activation = list(
    name = "Complement Activation",
    description = "Classical and alternative complement pathway components",
    genes = c("C1QA", "C1QB", "C1QC", "C3", "C4A", "C4B", "C5", "CFB", "CFD")
  ),
  
  # Antigen Presentation
  antigen_presentation_mhc_i = list(
    name = "MHC Class I Antigen Presentation",
    description = "MHC class I molecules and processing machinery",
    genes = c("HLA-A", "HLA-B", "HLA-C", "B2M", "TAP1", "TAP2", "PSMB8", "PSMB9")
  ),
  
  antigen_presentation_mhc_ii = list(
    name = "MHC Class II Antigen Presentation",
    description = "MHC class II molecules and processing components",
    genes = c("HLA-DRA", "HLA-DRB1", "HLA-DPA1", "HLA-DPB1", "HLA-DQA1", "HLA-DQB1", "CD74")
  ),
  
  # Cell Death
  apoptosis = list(
    name = "Apoptosis",
    description = "Pro-apoptotic signaling and execution",
    genes = c("BAX", "BAK1", "BID", "CASP3", "CASP8", "CASP9", "FAS", "FASLG", "TNFRSF1A")
  ),
  
  pyroptosis = list(
    name = "Pyroptosis",
    description = "Inflammatory cell death pathway",
    genes = c("CASP1", "GSDMD", "IL1B", "IL18", "NLRP3", "PYCARD")
  ),
  
  # T Cell Subsets
  th1_response = list(
    name = "Th1 Response",
    description = "Th1 polarization and effector function",
    genes = c("IFNG", "TBX21", "IL12RB2", "STAT1", "STAT4", "CXCR3")
  ),
  
  th2_response = list(
    name = "Th2 Response",
    description = "Th2 polarization and effector function",
    genes = c("IL4", "IL5", "IL13", "GATA3", "IL4R", "CCR4")
  ),
  
  th17_response = list(
    name = "Th17 Response",
    description = "Th17 polarization and effector function",
    genes = c("IL17A", "IL17F", "IL22", "RORC", "IL23R", "CCR6")
  ),
  
  treg_function = list(
    name = "Regulatory T Cell Function",
    description = "Treg suppressive function and markers",
    genes = c("FOXP3", "IL2RA", "CTLA4", "IL10", "TGFB1", "IKZF2")
  ),
  
  # Immune Checkpoint
  immune_checkpoint = list(
    name = "Immune Checkpoint",
    description = "Co-inhibitory immune checkpoint molecules",
    genes = c("PDCD1", "CD274", "PDCD1LG2", "CTLA4", "LAG3", "HAVCR2", "TIGIT", "BTLA")
  ),
  
  costimulatory_signals = list(
    name = "Co-stimulatory Signals",
    description = "Co-stimulatory molecules for T cell activation",
    genes = c("CD28", "CD80", "CD86", "ICOS", "ICOSLG", "CD137", "CD137L", "CD134", "CD252")
  ),
  
  # Tissue Remodeling
  tissue_remodeling = list(
    name = "Tissue Remodeling",
    description = "Matrix metalloproteinases and tissue remodeling factors",
    genes = c("MMP1", "MMP2", "MMP9", "MMP13", "TIMP1", "TIMP2", "COL1A1", "FN1")
  ),
  
  # Oxidative Stress
  oxidative_stress = list(
    name = "Oxidative Stress Response",
    description = "Reactive oxygen species and oxidative stress",
    genes = c("CYBB", "NCF1", "NCF2", "NOX1", "SOD1", "SOD2", "CAT", "GPX1")
  )
)

# Save the pathways data
# Note: This would typically use usethis::use_data() but we'll save directly
save(pathways, file = "../data/pathways.rda", compress = "xz")

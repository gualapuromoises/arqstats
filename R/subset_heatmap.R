#' A ComplexHeatmap subseted by gen names
#'
#' Gene names are used to filter
#' @param x matrix() expression level by genes (rows) and species (columns)
#' @param especies character() species to be selected in this function
#' @param genes character() genes to be selected in this function
#'
#' @return
#' A plot of ComplexHeatmap::Heatmap type
#' @export
#'
#' @examples
##' # Creates a dummy gene expression matrix
#' expresion_genes <- matrix(rnorm(100), nrow = 10)
#' colnames(expresion_genes) <- paste0("especie_",letters[1:10])
#' rownames(expresion_genes) <- paste0("gene_",letters[1:10])
#'
#' # Run example
#' subset_heatmap(expresion_genes,
#'        especies = c("especie_a", "especie_b","especie_c"),
#'        genes = c("gene_d","gene_e","gene_f"))
#'
#'
subset_heatmap <- function(x, especies = NULL, genes = NULL) {
  # subset matrix
  x_subset <- x[genes,especies]

  # plot heatmap
  ComplexHeatmap::Heatmap(x_subset,
                          cluster_columns = FALSE,
                          heatmap_legend_param = list(title = "log2"))
}



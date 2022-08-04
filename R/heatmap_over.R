
#' A filtered ComplexHeatmap
#'
#' This function allows to filter a matrix of gene expression and plot a ComplexHeatmap.
#' Values below a cutoof will be replaced by NA and plotted in gray
#'
#' @param x Matrix of gene expression of x genes
#' @param cutoff double() Value to filter the matrix
#'
#' @return
#' A figure of ComplexHeatmap::Heatmap type
#' @export
#'
#' @examples
#' # Creates a dummy gene expression matrix
#' expresion_genes <- matrix(rnorm(100), nrow = 10)
#' colnames(expresion_genes) <- paste0("especie_",letters[1:10])
#' rownames(expresion_genes) <- paste0("gene_",letters[1:10])
#'
#' # Run example
#' subset_heatmap(expresion_genes)
#'
heatmap_over <- function(x, cutoff =  0) {
  # subset matrix
  x_filter <- x
  x[x_filter <= cutoff] = NA

  # plot heatmap
  ComplexHeatmap::Heatmap(x_filter,
                          cluster_columns = FALSE,
                          cluster_rows = FALSE,
                          heatmap_legend_param = list(title = "log2"))
}

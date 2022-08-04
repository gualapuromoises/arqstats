expresion_genes <- matrix(rnorm(100), nrow = 10)
rownames(expresion_genes) <- paste0("gene_",letters[1:10])
colnames(expresion_genes) <- paste0("especie_",letters[1:10])

test_that("Output is a ComplexHeatmap", {
  resultado <- subset_heatmap(expresion_genes,
                              especies = c("especie_a", "especie_b","especie_c"),
                              genes = c("gene_d","gene_e","gene_f"))
  expect_s4_class(resultado, "Heatmap")
})


test_that("Empty argument genes are detected",{
  expect_error(subset_heatmap(expresion_gene,
                              especies = c("especie_a", "especie_b","especie_c")) )
})


test_that("Error with data frame works",{
  expect_error(subset_heatmap(as.data.frame(expresion_genes)) )
})

subset_heatmap <- function(x, especies = NULL, genes = NULL) {
  # evalate class of x
  stopifnot("x must be a matrix" = inherits(x, "matrix"))

  # subset matrix
  x_subset <- x[genes,especies]

  # plot heatmap
  ComplexHeatmap::Heatmap(x_subset,
                          cluster_columns = FALSE,
                          heatmap_legend_param = list(title = "log2"))
}

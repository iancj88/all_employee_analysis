

ReadfromExcelFiles <- function(name_and_filepaths, col_types) {
  require(readxl)

  data_sets <- lapply(name_and_filepaths, FUN = read_excel, sheet = 1,
                      col_types = col_types, col_names = T)
  return(data_sets)
}





#' Add a Column of key values to a dataframe
#'
#' @description the data held in the column will be comprised of the
#'   concatenation of the values found in other columns of that row. Useful for
#'   join statements or other applications requiring a unique value per row.
#'
#' @param df the dataframe to which a key column will be added. key values must
#'   be contained in vector
#' @param ... the column names to be combined into key values
#' @param key_col the name of the key column. default = "key".
#' @param use.all.cols a boolean that specifies whether to use all values.
#'   default is FALSE.
#'
#' @return the dataframe with an additional column containing key-values.
#' @export
#'
#' @examples
AddKeyValuesToDF <- function(df, ..., key_col, use.all.cols) {
  #set default values
  if (missing(key_col)) {key_col <- "key"}
  if (missing(use.all.cols)) {use.all.cols <- F}

  #determine columns to be used key
  if (!use.all.cols %in% c(0,1)) {stop(str_c('use.all.cols must be boolean value. Given: ', use.all.cols))}
  if (use.all.cols == T) {
    key_components <- names(df)
  } else {
    key_components <- list(...)
  }

  #initialize the key column
  col_names <- colnames(df)
  df[, key_col] <- rep_len("", length.out = nrow(df))

  #loop through each column specified by the input and add it to the key
  for (key_col_name in key_components) {
    #ensure that the column to be used to create the key values exists in the dataframe
    if (!key_col_name %in% col_names) {
      stop(str_c(key_col_name, ' is not a column name contained in the dataframe.'))
    }
    #add the column values to the key
    df[ , key_col] <- str_c(df[ , key_col], df[,key_col_name])
  }

  return(df)
}

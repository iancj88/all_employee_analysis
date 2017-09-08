#' Determine a given file's type
#' @description determine a file's type by it's file extension. Common file types include excel -- .xls, .xlsx, .xlsm and csv -- .csv or .txt
#' @param fname the name or extension of the file
#'
#' @return a string description of the file type i.e. "excel" or "csv"
#' @export
#'
#' @examples
GetFileType <- function(fname) {
  #check everything after the period
  ftypestr <- sub(pattern = ".*\\.", replacement = "", x = fname)

  #check it against the list of file names to extensions
  ftypemaster <- c("xlsx" = "excel", "xlsm" = "excel", "txt" = "csv", "csv" = "csv")
  type <- ftypemaster[ftypestr]
  return(type)
}

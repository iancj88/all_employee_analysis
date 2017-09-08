#' Load Data From a File
#'
#' @description Load a dataframe from a given excel or csv file with a simpler call than readxl or read.csv alternatives
#' @usage LoadFromFile(fname, fpath, skip, delim = ",")
#'
#' @param fname the name of the file to be loaded including it's file type suffix
#' @param fpath the path of the file
#' @param skip the number of rows to skip before reading data
#' @param delim the deliminator if the input file is a csv type
#'
#' @return dataframe containing the file's data with column names
#' @export
#'
#' @examples
LoadSIngleFile <- function(fname, fpath, skip, delim) {
  require(stringr)
  require(readxl)

  #stop if the file or directory does not exist.
  full_path <- str_c(fpath, fname)
  stopifnot(!CheckForDirNotExist("fpath"), !CheckForFileNotExist("full_path"))

  if(!require(readxl)) {
    install.packages(readxl)
  }

  #get the file type from the file extension (those letters after the final . in the )
  ftype <- GetFileType(fname)

  #setup various file type handlers here
  if (ftype == "excel") {
    new_df <- read_excel(path = fpath, sheet = 1, col_names = TRUE, skip = skip)
  } else if (ftype == "csv") {
    new_df <- read.csv(file = fpath, header = TRUE, sep = delim)
  }
  return(new_df)
}

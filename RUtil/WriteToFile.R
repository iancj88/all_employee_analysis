#' Write a Dataframe to a file as seperated values
#'
#' Checks for existence of file and directory specified. If either don't exist,
#' they are created.
#' @author Ian C Johnson
#'
#' @param df dataframe to be written
#' @param fname string name of the file name including file extension. If it
#'   doesn't exist, it will be created.
#' @param fpath the path of the save location. If it doesn't exist, it will be
#'   created.
#' @param delim the string character to seperate the values in the new file.
#'   Default = ","
#'
#' @return NULL
#' @export
#'
#' @examples
#' WriteToFile(df = myDataFrame, fname = "myFileName.csv", fpath = "./path from home dir/", delim = ",")

WriteToFile <- function(df, fname, fpath, delim, addAsNewSht) {
  require(openxlsx)
  require(readr)
  require(stringr)

  #determine the type of file to be written
  ftype <- GetFileType(fname)

  #create the total file path for existence checks
  full_path <- str_c(fpath, fname)

  if (CheckForDirNotExist(fpath)) {
    dir.create(fpath)
  }

  ftype <- GetFileType(fname)
  if (CheckForFileNotExist(full_path)) {
    if (!ftype == "excel") {
      file.create(full_path)
    }
  }




  #add logic to handle various file types here
  if (ftype == "csv") {
    if (missing(delim)) {delim <- ", "}
    write_delim(df, path = full_path, append = FALSE, delim = delim)
  } else if (ftype == "excel") {
    #
    # placeholder for a headerstyle and table styles
    #
    if(missing(addAsNewSht)) {addAsNewSht <- T}
    write.xlsx(df, file = full_path,
               creator = Sys.getenv("USERNAME"),
               startCol = 1, startRow = 2,
               colNames = TRUE, keepNA = TRUE,
               firstActiveRow = 3, colWidths = "auto",
               overwrite = TRUE)
  }
}

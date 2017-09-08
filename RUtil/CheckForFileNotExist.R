CheckForFileNotExist <- function(full_path) {
  doesNotExist <- !file.exists(full_path)
  return(doesNotExist)
}

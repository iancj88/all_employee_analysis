CheckForDirNotExist <- function(fpath) {
  doesNotExist <- !dir.exists(fpath)
  return(doesNotExist)
}

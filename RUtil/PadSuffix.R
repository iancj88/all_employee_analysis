#' PadSuffix takes a string and addes a preceeding zero if necessary
#'
#' Typically used to added dropped leading zeros to a suffix
#' @title PadSuffix
#' @author Ian C Johnson
#' @param suffix string which will have any dropped zeros readded
#'
#' @return a two digit suffix
#' @export
#'
#' @examples
#' PadSuffix("0")
#' \dontrun{PadSuffix(NULL)}
PadSuffix <- function(suffix) {
  if (str_length(suffix) == 1) {
    suffix_out <- stri_replace_first_regex(suffix, "([0-9])$", "0$1")
  } else {
    suffix_out <- suffix
  }
  return(suffix_out)
}

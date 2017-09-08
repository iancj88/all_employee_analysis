#' PadGID
#'
#' ensure that a gid is the proper length. Typically used to ensure that this
#' unique key is comparable across datasets.
#' @author Ian C Johnson
#' @param gid_no_zeros numeric value with leading zeros dropped
#'
#' @return string value with leading zeros added to ensure that the total length
#'   of the input is 9 chars
#' @export
#'
#' @examples
#' PadGID(-1234567)
#' \dontrun{PadGID(NULL)}
PadGID <- function(gid_no_zeros) {

  require(stringr)
  default_length_of_Gid <- 9
  length_of_this_Gid <- nchar(gid_no_zeros)

  #make each element of the gid: prefix dash, zeros(if necessary), and 1:9 numeric portion of gid
  gid_no_zeros_no_dash <- DropDashFromGid(gid_no_zeros)
  zeros_string <- paste(rep("0", default_length_of_Gid - length_of_this_Gid), collapse = "")
  gid_prefix <- "-"

  #paste the gid, zero string, and prefix elements together
  gid_with_dash_and_zeros <- paste(gid_prefix,zeros_string, gid_no_zeros_no_dash,
                                   collapse = "", sep = "")

  return(gid_with_dash_and_zeros)
}


#' DropDashFromGid
#'
#' Drops first character of GID if it is a dash i.e. "-"
#'
#' @param gid
#'
#' @return string with no proceeding dash character
#' @export
#'
#' @examples
#' DropDashFromGid(-01245)
#' \dontrun{DropDashFromGid(NULL)}
DropDashFromGid <- function(gid) {
  stopifnot(substr(gid,1,1) == "-")
  gid_minus_dash <- substr(gid, 2, nchar(gid))
  return(gid_minus_dash)
}

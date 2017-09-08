#' Calculate the fiscal year of a given column of dates.
#' Append those fiscal years to the input dataframe.
#'
#' @description The MUS fiscal year runs July 1st - June 31st. For example, June 5th, 2015 falls in Fiscal Year (FY) 15.
#' @description Alternatively, July 5th, 2015 falls in FY 16. This function correctly calculates the fiscal year of a given
#' @description colu7mn of dates from the input dataframe. It then appends these dates to that same dataframe.
#' @usage AddJobEcls(df, path_to_timesheet_report)
#'
#' @param df the dataframe to which the appropriate Job Ecls will be appended with the title "Jobs_Ecls"
#' @param date_col_name the name of the column with the new dates.
#' @param fy_col_name the name of the newly appended fiscal year column
#'
#' @return dataframe with appended fiscal year column
#' @export
#'
#' @examples
AddFiscalYear <- function(df, date_col_name, fy_col_name) {
  require(lubridate)

  # MSU Fiscal year begins July 1, so any date in the
  # third or fourth quarter will be the next fiscal year
  quarter_number <- quarter(df[, date_col_name])
  year_vec <- year(df[, date_col_name])
  df[, fy_col_name] <- (quarter_number > 2) + year_vec

  return(df)
}

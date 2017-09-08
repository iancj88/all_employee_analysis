#' Add the NBAJOBS Ecls to a job row given it's GID, POSN, SUFF Key.
#'
#' @description Load position job eclasses from the ReportWeb Timesheet Report and joins them to the input dataframe.
#' @description The input dataframe must contain the GID, Position Number, Suffix Key with the name "Key"
#' @usage AddJobEcls(df, path_to_timesheet_report)
#'
#' @param df the dataframe to which the appropriate Job Ecls will be appended with the title "Jobs_Ecls"
#' @param path_to_timesheet_report the directory path containing the timesheet csv files. The most recent file will be selected.
#'
#' @return dataframe with the job ecls as a new column
#' @export
#'
#' @examples
AddJobEcls <- function(df, path_to_timesheet_report) {
  require(stringr)
  require(dplyr)

  #load the newest timesheet report which contains the job ecls data
  timesheet_reports <- list.files(path = path_to_timesheet_report,
                                  full.names = TRUE)

  timesheet_reports <- str_sort(timesheet_reports,
                                decreasing = TRUE)[1]

  employee_timesheet_rpt <- read.csv2(file = timesheet_reports,
                                      header = TRUE,
                                      skip = 6,
                                      row.names = NULL)

  # ensure that the GIDs are padded to allow for the data to be joined with the
  #   all ee dataset
  employee_timesheet_rpt$Key <- str_c(employee_timesheet_rpt$GID,
                                      employee_timesheet_rpt$Position,
                                      employee_timesheet_rpt$Suffix)

  employee_timesheet_rpt <- select(employee_timesheet_rpt,
                                   Key,
                                   Jobs_Ecls = Employee.Class)

  # ready to combine the data
  df <- left_join(df, employee_timesheet_rpt, by = c("Key" = "Key"))

  return(df)
}

CompileAllEEReports <- function(path_to_files) {
  require(lubridate)

  #get the list of wb file names and filepaths
  wb_names_and_filepaths <- list.files(path_to_files, full.names = TRUE)
  wb_names_only <- list.files(path_to_files, full.names = FALSE)

  #read each wb into a separate dataframe
  wb_col_types <- GetAllEEColTypes()
  all_ee_datasets <- lapply(wb_names_and_filepaths, FUN = read_excel, sheet = 1,
                            col_types = wb_col_types, col_names = T)

  #Name the dataset list using the date in the file name,
  # this works because the files are read in the same order
  # above as the filenames are read here.

  report_date_chr <- gsub("All EE ", "", wb_names_only) %>% #Remove the preceeding All EE prefix from the filename
  {gsub(".xlsx", "", . )} #Remove the excel file type suffix from the filename

  names(all_ee_datasets) <- report_date_chr

  #put the date (currently stored in the names of the dataframes) into a column of each dataframe
  all_ee_datasets <- mapply(FUN = function(x,dte) {date_vec <- c(rep(dte, nrow(x))); x$Date <- as.POSIXct(date_vec); return(x)},
                            all_ee_datasets, names(all_ee_datasets), SIMPLIFY = F)

  #combine dataframes
  df_allEE <- bind_rows(all_ee_datasets)

  return(df_allEE)
}

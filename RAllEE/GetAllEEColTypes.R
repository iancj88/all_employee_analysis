GetAllEEColTypes <- function() {
  ### These are the column names output on the all ee report as of Nov. 23, 2016:

  # [1] "GID"                     "Last Name"               "First Name"
  # [5] "Home Street 1"           "Home Street 2"           "Home Street 3"
  # [9] "City"                    "State"                   "Zip"                     "Campus"
  # [13] "Pict Code"               "Department"              "Home Orgn Number"        "Budget Org."
  # [17] "Budget Org. Long Desc."  "Org. Heirarchy"          "Job Title"               "Status"
  # [21] "PEAEMPL ECLS"            "ECLS Description"        "MUS"                     "Position Number"
  # [25] "Suffix"                  "Position Title"          "FTE"                     "Job Type"
  # [29] "Pays"                    "Current Hire Date"       "Campus Orig. Hire"       "Longevity Date"
  # [33] "Annual Lv Accrual"       "Anniversary Date"        "Last Work Date"          "Job Begin Date"
  # [37] "Employee Group"          "Hourly Rate"             "Annual Salary"           "Assgn Salary"
  # [41] "Retirement"              "Union"                   "Union Deduction"         "BCAT"
  # [45] "Leave Category"          "Sex"                     "Race 1"                  "Birth Date"
  # [49] "SOC Code"                "SOC Description"         "Email"                   "Phone"
  # [53] "Index"                   "Fund"                    "Orgn"                    "Account"
  # [57] "Program"                 "Percent"

  # [1] "GID"                    "Last Name"              "First Name"             "Home Street 1"          "Home Street 2"
  # [6] "Home Street 3"          "City"                   "State"                  "Zip"                    "Campus"
  # [11] "Pict Code"              "Department"             "Home Orgn Number"       "Budget Org."            "Budget Org. Long Desc."
  # [16] "Org. Heirarchy"         "Job Title"              "Status"                 "PEAEMPL ECLS"           "ECLS Description"
  # [21] "MUS"                    "Position Number"        "Suffix"                 "Position Title"         "FTE"
  # [26] "Job Type"               "Pays"                   "Current Hire Date"      "Campus Orig. Hire"      "Longevity Date"
  # [31] "Annual Lv Accrual"      "Anniversary Date"       "Last Work Date"         "Job Begin Date"         "Employee Group"
  # [36] "Hourly Rate"            "Annual Salary"          "Assgn Salary"           "Retirement"             "Union"
  # [41] "Union Deduction"        "BCAT"                   "Leave Category"         "Sex"                    "Race 1"
  # [46] "Birth Date"             "SOC Code"               "SOC Description"        "Email"                  "Phone"
  # [51] "Index"                  "Fund"                   "Orgn"                   "Account"                "Program"
  # [56] "Percent"


  t <- "text"
  n <- "numeric"
  d <- "date"
  b <- "blank"
  col_types <- c(rep(t, 24), n, t, n, rep(d, 7), t, rep(n, 3), rep(t, 7), d, rep(t, 9), n)
  return(col_types)
}

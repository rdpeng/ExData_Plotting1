library(data.table)

suppressWarnings(DT <- fread("../household_power_consumption.txt"))

strtotime <- function(a_string) {
  vals <- unlist(strsplit(a_string, ":"))
  nums <- as.numeric(vals)
  nums[1] + (nums[2] + (nums[3] / 60)) / 60
}
  

DT[, Date := as.Date(Date, "%d/%m/%Y")]
DT[, Time := strtotime(Time)]
# Loading the data
#

setwd("~/Desktop/Coursera/ExData_Plotting1")

unzip("exdata-data-household_power_consumption.zip")
datafile <- "./household_power_consumption.txt"
data <- read.table(datafile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec=".")
datasubset <- data[data$Date %in% c("1/2/2007", "2/2/2007") ,]
dl <- function() {

# change wd
setwd("C:/Users/d034390/ExData_Plotting1")

# load the libs
library(dplyr)


# read file (I alreday unzipped the file)

po <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?" , sep = ";" , stringsAsFactors = FALSE)


# convert string to date 
#po$Date <- as.Date(po$Date, format="%d/%m/%Y")

# subset the data
filtered_power <- po[po$Date %in% c("1/2/2007","2/2/2007") ,]


#create a timestamp to the x achis lableing
filtered_power$timestamp <-paste(filtered_power$Date, filtered_power$Time)

return(filtered_power)

}
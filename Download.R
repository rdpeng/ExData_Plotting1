## We will use this script to download the zip file of the exercise, unzip it,
## filter first and second of February 2007, and save it in another csv file.
## By doing this we will have a more manageable file for other scripts

library(dplyr)

url_zip <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipname <- "household_power_consumption.zip"
download.file(url_zip, zipname)
unzip(zipname)

#Now we have the household_power_consumption.txt file created

total_data <- read.csv("household_power_consumption.txt", sep = ";")
power_cons <- filter(total_data, Date == "1/2/2007"| Date == "2/2/2007")

## Save the reduced file power_cons to another csv separed by ";", as it was in 
## the original data file.

filename <- "hpc_20070201_20070202.txt"
write.csv(power_cons, file = filename, row.names = FALSE)

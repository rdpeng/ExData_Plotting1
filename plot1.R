setwd("~/R/Explanatory Data Analysis/Assignement01/exdata-data-household_power_consumption")
downloadFileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
downloadFileTarget <- "./Data/household_power_consumption.zip"
household_power_consumption <- "./Data/household_power_consumption.txt"
##
if (!file.exists(household_power_consumption)) {
  download.file(downloadFileURL, downloadFileTarget, method = "curl")
  if (!file.exists(downloadFileTarget)) {
    unzip(downloadFileTarget, overwrite = T, exdir = "./Data")
  }
}

## Calculate Rough Estimated Size of Data

estimatedSize <- 2075259 *  9 * 8 / 2^20
##FreePhysicalMemory <- system('wmic OS get FreePhysicalMemory /Value')
FreePhysicalMemory <- as.numeric(gsub("\r","",gsub("FreePhysicalMemory=","",system('wmic OS get FreePhysicalMemory /Value',intern=TRUE)[3])))/1024

paste ("Dataset Size in MB: ",estimatedSize) 
paste ("Available System Memory in MB: ",FreePhysicalMemory)


if (estimatedSize > FreePhysicalMemory)
{
  stop("Warning ! Could not process the file due to lack of available memory")
}

ba <- read.table(text = grep("^[1,2]/2/2007", readLines(household_power_consumption), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

# Generating Plot 1
hist(ba$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")




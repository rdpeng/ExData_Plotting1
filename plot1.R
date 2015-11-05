# Check to see if the data file is downloaded
if (!file.exists("./household_power_consumption.txt")) {
    
    # download the data
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    fileName <- "household_power_consumption.zip"
    download.file(fileUrl, fileName, method = "curl")
    
    # unzip file
    unzip(fileName)
    }

# read data  
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# convert Date variable to Date class
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# return subset data
data[data$Date == "2007/02/01" | data$Date == "2007/02/02", ]

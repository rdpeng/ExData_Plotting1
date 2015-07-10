# Change the working directory so you can easily find where the data and plots are
#  For example setwd("C:/Users/username/My Documents/R/")
#  Obviously, if you don't change the dir below, you'll get an error 
setwd("C:\Users\alex\OneDrive\My Docs (HP Laptop)\GitHub\ExData_Plotting1")

# Check if "data" directory exists and if not, create it 
if (!file.exists("data")) { 
  dir.create("data") 
}

# Download compressed file, unzip and read it into R
#  I've laid out each step. More code but easier to follow 
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./data/household_power_consumption.zip")
unzip(zipfile = "./data/household_power_consumption.zip", exdir = "./data")
powerData <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE)
head(powerData)   # preview the data
str(powerData)    # review the data types of each field

# Clean up data: subset for dates, combine date & time, convert types, etc.
powerData$Date; <- as.Date(powerData$Date, "%d/%m/%Y")
powerData <- subset(powerData, powerData$Date >= '2007-02-01' & powerData$Date <= '2007-02-02')
powerData$Date <- as.POSIXct(paste(powerData$Date, powerData$Time), format="%Y-%m-%d %H:%M:%S")
powerData$Time <- NULL
powerData$Global_active_power <- as.numeric(levels(powerData$Global_active_power)[powerData$Global_active_power])
head(powerData)   # review the data
str(powerData)    # review the data types of each field

# Create Plot 2 -  of Global Active Power frequency
plot(powerData$Date, powerData$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "data/plot2.png") # Copy plot to PNG file
dev.off()

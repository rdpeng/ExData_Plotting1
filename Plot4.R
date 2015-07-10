# Change the working directory so you find the data and plots
#  Obviously, if you use my dir below, you'll get an error 
# setwd("C:\Users\alex\OneDrive\My Docs (HP Laptop)\GitHub\ExData_Plotting1")

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
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")
powerData <- subset(powerData, powerData$Date >= '2007-02-01' & powerData$Date <= '2007-02-02')
powerData$Date <- as.POSIXct(paste(powerData$Date, powerData$Time), format="%Y-%m-%d %H:%M:%S")
powerData$Time <- NULL
powerData$Global_active_power <- as.numeric(levels(powerData$Global_active_power)[powerData$Global_active_power])
powerData$Global_reactive_power <- as.numeric(levels(powerData$Global_reactive_power)[powerData$Global_reactive_power])
powerData$Voltage <- as.numeric(levels(powerData$Voltage)[powerData$Voltage])
powerData$Global_intensity <- as.numeric(levels(powerData$Global_intensity)[powerData$Global_intensity])
powerData$Sub_metering_1 <- as.numeric(levels(powerData$Sub_metering_1)[powerData$Sub_metering_1])
powerData$Sub_metering_1 <- as.numeric(levels(powerData$Sub_metering_1)[powerData$Sub_metering_1])
head(powerData)   # review the data
str(powerData)    # review the data types of each field

# Create Plot 4 -  2 x 2 grid of plots
#  Note - plots are in /data subfolder relative to the working dir
#  Also - text in legend does not copy well using dev.copy()
#  Made explicit call to png() function so legend text formats correctly
png(filename = "data/plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# top left
plot(powerData$Date, powerData$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

# top right
plot(powerData$Date, powerData$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

# bottom left
#  NOTE - looked like there was no border around the legend, so removed
plot(powerData$Date, powerData$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab ="")
lines(powerData$Date, powerData$Sub_metering_1, type = "l")
lines(powerData$Date, powerData$Sub_metering_2, type = "l", col = "red")
lines(powerData$Date, powerData$Sub_metering_3, type = "l", col = "blue")
legend("topright", c(names(powerData)[6], names(powerData)[7], names(powerData)[8]), lty=c(1,1,1), lwd=c(2.5,2.5), col=c("black", "red", "blue"), bty = "n")

# bottom right
plot(powerData$Date, powerData$Global_reactive_power, type = "l", ylab ="Global_reactive_power", xlab = "datetime")

dev.off()

# Don't forget to set working directory

# Create a proejct diretory if it doesn't exist already
if(!file.exists("project1")) {
        dir.create("project1")
}
        
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileURL, destfile="Fhousehold_power_consumption.zip")
unzip("Fhousehold_power_consumption.zip", exdir="./project1")


myfile <- file("./project1/household_power_consumption.txt")
mysubset <- read.table(text = grep("^[1,2]/2/2007", readLines(myfile), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

# Convert factor date to date format
mysubset$Date <- as.Date(mysubset$Date, format="%d/%m/%Y")
# Combine date and factor formatted time
DateTime <- paste(as.Date(mysubset$Date), mysubset$Time)
# Convert time to the data frame
mysubset$datetime <- as.POSIXct(DateTime)


## Generating Plot 2
par(mfrow = c(1,1), mar = c(5,4,4,2))
png(filename="plot2.png")                                                    
plot(mysubset$Global_active_power ~ mysubset$datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

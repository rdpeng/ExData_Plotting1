# Create a proejct diretory if it doesn't exist already
if(!file.exists("project1")) {
        dir.create("project1")
}
        
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileURL, destfile="Fhousehold_power_consumption.zip")
unzip("Fhousehold_power_consumption.zip")


myfile <- file("./Fhousehold_power_consumption/Fhousehold_power_consumption.txt")
mysubset <- read.table(text = grep("^[1,2]/2/2007", readLines(myfile), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

# Generating Plot 1
par(mfrow = c(1,1), mar = c(5,4,4,2))
png(filename="plot2.png") 
hist(mysubset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
dev.off()
     

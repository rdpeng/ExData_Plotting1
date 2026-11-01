# Downloading and unzipping the dataset
if(!file.exists("./project1"))
{dir.create("./project1")}
datalink <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(datalink,destfile="./project1/power_consumption.zip")
unzip(zipfile="./project1/power_consumption.zip",exdir="./project1")

#Reading complete table
data_table <- read.table("./project1/household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

# Filtering data from the dates 2007-02-01 and 2007-02-02
data_table$Date <- as.Date(data_table$Date, format = "%d/%m/%Y")
date_subset <- subset(data_table, data_table$Date >= as.Date("2007-2-1") & data_table$Date <= as.Date("2007-2-2"))

# Merging date and Time column and adding it to the data subset
dateTime <- paste(date_subset$Date, date_subset$Time)
date_subset <- cbind(dateTime, date_subset)
## Format dateTime Column
date_subset$dateTime <- as.POSIXct(dateTime)
View(date_subset)

# Generating the fourth Plot
par(mfrow=c(2,2), mar=c(1,1,1,1))
plot(date_subset$dateTime, date_subset$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(date_subset$dateTime, date_subset$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(date_subset$dateTime, date_subset$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(date_subset$dateTime, date_subset$Sub_metering_2, type="l", col="red")
lines(date_subset$dateTime, date_subset$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black","red","blue"), cex= 0.5)
plot(date_subset$dateTime, date_subset$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()
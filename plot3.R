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

# Generating the third Plot
plot(date_subset$dateTime, date_subset$Sub_metering_1, col="black", type = "l", xlab="", ylab="Energy sub metering")
lines(date_subset$dateTime, date_subset$Sub_metering_2, col="red")
lines(date_subset$dateTime, date_subset$Sub_metering_3, col="blue")

legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.5)
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()
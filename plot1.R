#Read the specified lines of the dataset
#Give the appropriate column names to the columns
data <- read.table("./household_power_consumption.txt", sep=";", nrows=2880, skip=66637)
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#Plot the histagram of the Global Active Power and save it in a PNG file
png(file = "plot1.png")
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()
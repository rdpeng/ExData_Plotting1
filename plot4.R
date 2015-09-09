#Take input of Household Power consumption file.
filepath <- "./Data/household_power_consumption.txt"
inputdata <- read.table(filepath, header = TRUE, sep = ";", dec=".", stringsAsFactors = FALSE)

#Make the Date column as Date Data type
inputdata$Date <- as.Date(inputdata$Date, format="%d/%m/%Y")

#Subset it using Date column from 2007-02-01 to 2007-02-02
subset_data <- subset(inputdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
#Remove the previous file beacuse it is not needed now.
rm(inputdata)
par(mfrow = c(2,2))
subset_data$DateTime <- as.POSIXct(paste(as.Date(subset_data$Date), subset_data$Time))

 

plot(subset_data$DateTime, as.numeric(subset_data$Global_active_power), type="line", xlab="", ylab="Global Active Power")
plot(subset_data$DateTime, as.numeric(subset_data$Voltage), type="line", xlab="datetime", ylab="Voltage")

plot(subset_data$DateTime, as.numeric(subset_data$Sub_metering_1), type="line", ylab="Energy Submetering", xlab="")
lines(subset_data$DateTime, as.numeric(subset_data$Sub_metering_2), type="line", col="red")
lines(subset_data$DateTime, as.numeric(subset_data$Sub_metering_3), type="line", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=, bty="n", col=c("black", "red", "blue"))
plot(subset_data$DateTime, as.numeric(subset_data$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

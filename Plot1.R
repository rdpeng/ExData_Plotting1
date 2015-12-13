## read data ## 
data <-read.table("F:\\Coursea\\04. Exploratory Data Analysis\\Course Project\\Course Project1\\household_power_consumption.txt", sep=";", header=TRUE)
subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## plot the graphic ##
globalActPower <- as.numeric(subset_data$Global_active_power)
png("F:\\Coursea\\04. Exploratory Data Analysis\\Course Project\\Course Project1\\plot1.png", width=480, height=480)
hist(globalActPower, col="red", main="Global Active Power", xlab="Global Active Power(kilowatts)")
dev.off()

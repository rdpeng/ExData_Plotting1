## read data ## 
data <-read.table("F:\\Coursea\\04. Exploratory Data Analysis\\Course Project\\Course Project1\\household_power_consumption.txt", sep=";", header=TRUE)
subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## defined axis ##
datetime <- strptime(paste(subset_data$Date, subset_data$Time), format="%d/%m/%Y %H:%M:%S")
globalActPower <- as.numeric(subset_data$Global_active_power)

## plot the graphic ##
png("F:\\Coursea\\04. Exploratory Data Analysis\\Course Project\\Course Project1\\plot2.png", width=480, height=480)
plot(datetime,globalActPower, type="1", xlab=" ", ylab="Global Active Power(kilowatts)")
dev.off()

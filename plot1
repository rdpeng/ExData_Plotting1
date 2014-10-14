power<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character")

data <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]

data$Global_active_power<-as.numeric(data$Global_active_power)

hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

dev.copy(png,file = "plot1.png")

dev.off()

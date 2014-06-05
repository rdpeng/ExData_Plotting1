setwd("C:/Users/558966/Documents/Coursera")
data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?", colClasses = c("factor", "factor","numeric", "numeric", "numeric", "numeric","numeric","numeric","numeric"))

data$date.new <- as.Date(data$Date, format ="%d/%m/%Y")
data.new <- subset(data, data$date.new >= '2007-02-01' & data$date.new <= '2007-02-02')

data.new$datetime<-paste(data.new$date.new,data.new$Time, sep=" ")
data.new$datetime.new<-as.POSIXct(data.new$datetime)

plot(data.new$datetime.new, data.new$Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png,'plot2.png', width = 480, height = 480)
dev.off()

download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', 'household_power_consumption.zip')
unzip('household_power_consumption.zip')data<-household_power_consumption
data<-data[data$Date %in% c('1/2/2007', '2/2/2007'), ]


x <- paste(data$Date, data$Time)
x <-strptime(x, "%d/%m/%Y %H:%M:%S")

data$Time<-strptime(data$Time, "%H:%M:%S")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$Time2<-x

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(data, {
  plot(Time2,Global_active_power,t="l", ylab= "Global Active Power (kilowatts)",xlab="")
  plot(Time2,Voltage,t="l", ylab= "Voltage",xlab="datetime")
  plot(Time2,Sub_metering_1,t="l", ylab= "Energy sub Matering",xlab="")
  lines(Time2,Sub_metering_2,t="l", col="red")
  lines(Time2,Sub_metering_3,t="l", col="blue")
  legend("topright", pch = 1, col = c("black", "red", "blue"),lty=c(1,1), cex= 0.9,legend = c("Sub_matering_1", "Sub_matering_2","Sub_matering_3"))
  plot(Time2,Global_reactive_power,t="l", ylab= "Global_Reactive_Power",xlab="datetime")
  
})
dev.off()


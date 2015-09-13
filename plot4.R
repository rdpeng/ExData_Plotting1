## Plot 4

data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

data$Date<-as.Date(data$Date, "%d/%m/%Y")

data1<-data[which(data$Date==c("2007-02-01","2007-02-02")), ]

data1$Global_active_power<-as.numeric(data1$Global_active_power)
data1$Sub_metering_1<-as.numeric(data1$Sub_metering_1)
data1$Sub_metering_2<-as.numeric(data1$Sub_metering_2)
data1$Sub_metering_3<-as.numeric(data1$Sub_metering_3)
data1$Voltage<-as.numeric(data1$Voltage)
data1$Global_reactive_power<-as.numeric(data1$Global_reactive_power)


png(file="plot4.png")

par(mfcol=c(2,2))

plot(data1$Time,data1$Global_active_power, lty=1, 
     ylab="Global Active Power (kilowatts)")

Subs<-(data1$Sub_metering_1+data1$Sub_metering_2+data1$Sub_metering_3)

plot(data1$Time, Subs, ylab="Energy Sub Metering", type="n")
points(data1$Time,data1$Sub_metering_1)
points(data1$Time,data1$Sub_metering_2, col="red")
points(data1$Time,data1$Sub_metering_3, col="blue")

plot(data1$Time,data1$Voltage, lty=1, 
     ylab="Voltage")

plot(data1$Time,data1$Global_reactive_power, lty=1, 
     ylab="Global Rective Power (kilowatts)")

dev.off()
#Read data

data <- read.table("household_power_consumption.txt",sep=";",header=T, as.is=1:9)
data$Date <- as.Date(strptime(data$Date, format ="%d/%m/%Y"))
data$Time <- strptime(paste(data$Date,data$Time), format = "%Y-%m-%d %H:%M:%S")
data[,3:9] <- apply(data[,3:9],2,function(el) {as.numeric(el)})

#Filter data from dates 2007-02-01 and 2007-02-02
data2 <- data[data$Date %in% as.Date(c("2007-02-01","2007-02-02")),]
rm(data)

#Plot4
png(file="plot4.png",width = 480, height = 480)
par(mfcol=c(2,2))

#Subplot1
plot(data2$Time,data2$Global_active_power,
     type = "line",
     ylab="Global Active Power (kilowatts)",
     xlab="")

#Subplot2
plot(data2$Time,data2$Sub_metering_1,
     type = "line",
     ylab="Energy sub metering",
     xlab="")
lines(data2$Time,data2$Sub_metering_2,
      type = "line",
      col="red")
lines(data2$Time,data2$Sub_metering_3,
      type = "line",
      col="blue")
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1,
       lwd=2,
       cex=0.5,
       yjust=0)

#Subplot3
plot(data2$Time,data2$Voltage,
     type = "line",
     ylab="Voltage",
     xlab="datetime")

#Subplot4
plot(data2$Time,data2$Global_reactive_power,
     type = "line",
     ylab="Global_reactive_power",
     xlab="datetime")

#Close device
dev.off()


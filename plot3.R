#Read data
data <- read.table("household_power_consumption.txt",sep=";",header=T, as.is=1:9)
data$Date <- as.Date(strptime(data$Date, format ="%d/%m/%Y"))
data$Time <- strptime(paste(data$Date,data$Time), format = "%Y-%m-%d %H:%M:%S")
data[,3:9] <- apply(data[,3:9],2,function(el) {as.numeric(el)})

#Filter data from dates 2007-02-01 and 2007-02-02
data2 <- data[data$Date %in% as.Date(c("2007-02-01","2007-02-02")),]
rm(data)

#Plot3
png(file="plot3.png",width = 480, height = 480)
par(mfcol=c(1,1))
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
       cex=0.7)

#Close device
dev.off()

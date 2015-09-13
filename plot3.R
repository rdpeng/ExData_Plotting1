## Plot 3

data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

data$Date<-as.Date(data$Date, "%d/%m/%Y")

data1<-data[which(data$Date==c("2007-02-01","2007-02-02")), ]

data1$Sub_metering_1<-as.numeric(data1$Sub_metering_1)
data1$Sub_metering_2<-as.numeric(data1$Sub_metering_2)
data1$Sub_metering_3<-as.numeric(data1$Sub_metering_3)

png(file="plot3.png")

Subs<-(data1$Sub_metering_1+data1$Sub_metering_2+data1$Sub_metering_3)

plot(data1$Time, Subs, ylab="Energy Sub Metering", type="n", )
points(data1$Time,data1$Sub_metering_1)
points(data1$Time,data1$Sub_metering_2, col="red")
points(data1$Time,data1$Sub_metering_3, col="blue")

legend("topright", legend=c("Sub metering 1", "Sub metering 2", 
                            "Sub metering 3"), pch=c(1,1,1), 
                            col=c("black","red", "blue"))

dev.off()
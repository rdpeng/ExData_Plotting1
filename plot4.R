


#read data from file
data <- read.table('household_power_consumption.txt', colClasses = c("character", "character",
                                                                     "numeric", "numeric", "numeric", "numeric", "factor", "factor", "factor"), header =TRUE, sep =';', na.strings="?")



#add dateTime column
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# subset the data we want
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data<-data[data$Date>="2007-02-01",]
data<-data[data$Date<="2007-02-02",]
head(data,3)




# create the png with with the matching labels and size

png(filename="plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(data$DateTime, data$Global_active_power, xlab="",
     ylab="Global Active Power", main="", type="n")
lines(data$DateTime, data$Global_active_power, col="black")

plot(data$DateTime, data$Voltage, xlab="datetime",
     ylab="Voltage", main="", type="n")
lines(data$DateTime, data$Voltage, col="black")

plot(data$DateTime,data$Sub_metering_1,type="n", ,ylab="Energy sub metering",main="")
par(xpd=F)
with(data,lines(DateTime,as.numeric(as.character(Sub_metering_1))))
with(data,lines(DateTime,as.numeric(as.character(Sub_metering_2)),col="red"))
with(data,lines(DateTime,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, bty = "n", col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(data$DateTime, data$Global_reactive_power, xlab="datetime",
     ylab="Global_reactive_power", main="", type="n")
lines(data$DateTime, data$Global_reactive_power, col="black")

dev.off()




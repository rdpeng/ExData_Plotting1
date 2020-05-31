#Plot 3

#changing data class after importing data

data$Date<-as.Date(data$Date, format = "%d/%m/%Y" )
data$Time<- format(data$Time, format = "%H:%M:%S")


data$Global_active_power<-as.numeric(data$Global_active_power)
data$Global_reactive_power<-as.numeric(data$Global_reactive_power)
data$Voltage<-as.numeric(data$Voltage)
data$Global_intensity<-as.numeric(data$Global_intensity)
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)


datasubset<- subset(data, Date=="2007-02-01" | Date =="2007-02-02")

#to merge date and time

library(lubridate)
datasubset$DateTime<- paste(datasubset$Date,datasubset$Time)
datasubset$DateTime<- as.POSIXct(datasubset$DateTime)


#plot3

png("plot3.png", width = 480, height = 480)

submeter<- c("Sub_metering_1",
             "Sub_metering_2",
             "Sub_metering_3")
with(datasubset, plot(DateTime, Sub_metering_1, type= "l", col="black",
                      xlab="",ylab = "Energy sub metering"))

with(datasubset,lines(DateTime, Sub_metering_2, type="l", col="red"))
with(datasubset,lines(DateTime, Sub_metering_3, type="l", col="blue"))

legend("topright", submeter,lty = 1, col=c("black","red" ,"blue"))

dev.off()

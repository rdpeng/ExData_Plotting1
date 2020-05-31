#Plot1 

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


#plot 1
png("plot1.png", width = 480, height = 480)
hist(datasubset$Global_active_power, col = "red", 
     main="Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
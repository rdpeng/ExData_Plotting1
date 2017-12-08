#Plot 4:

#reading data

data_file<- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")

data_file$Date<- as.Date(data_file$Date, format="%d/%m/%Y")

#subsetting data

data_subset<- subset(data_file, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#converting date and time

date_time <- paste(as.Date(data_subset$Date), data_subset$Time)

data_subset$Datetime<- as.POSIXct(date_time)


#plotting base plot

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(data_subset, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})


#saving .png file

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
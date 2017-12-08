#Plot 3:

#reading data

data_file<- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")

data_file$Date<- as.Date(data_file$Date, format="%d/%m/%Y")

#subsetting data

data_subset<- subset(data_file, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#converting date and time

date_time <- paste(as.Date(data_subset$Date), data_subset$Time)

data_subset$Datetime<- as.POSIXct(date_time)


#plotting base plot

with(data_subset, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


#saving .png file

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
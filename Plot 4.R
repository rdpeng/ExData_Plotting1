#downloading and unziping files 

fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,"PowerData.zip")
unzip("PowerData.zip")

#Reading Data
dir()
Data<-read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F, quote='\"')
View(Data)
Data$Date <- as.Date(Data$Date, format="%d/%m/%Y")

#subsetting Dates
Data <- subset(Data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#merge Date and time
Date_Time<-paste(Data$Date,Data$Time)
Data$Date_time<-as.POSIXct(Date_Time)


#Creating Plot 4 with "with"
with(Data, {
  plot(Global_active_power~Date_time, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Date_time, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Date_time, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Date_time,col='Red')
  lines(Sub_metering_3~Date_time,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Date_time, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

#Extract Plot 4 to PNG
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

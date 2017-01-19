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


#creating plot 3 
plot(Data$Date_time,Data$Sub_metering_1,lines(Data$Sub_metering_2~Data$Date_time,col='Red'),lines(Data$Sub_metering_3,col="blue"),type = "l",ylab="Global Active Power (kilowatts)", xlab="")
with(Data, {plot(Sub_metering_1~Date_time, type="l",ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Date_time,col='Red')
  lines(Sub_metering_3~Date_time,col='Blue')
})

# Arranging Plot 3 legend

#cex=0.8 for legend font size
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"),lty=1, lwd=1,cex=0.8)


#Extract Plot 3 to PNG
dev.copy(png, file="Plot 3.png", height=480, width=480)
dev.off()

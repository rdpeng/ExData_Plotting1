setwd("/Users/nanjals/Desktop/DataScience/datasciencecoursera")
getwd()

householddata<-read.csv("household_power_consumption.txt", header = T, sep=';',
                        stringsAsFactors=FALSE, comment.char="", quote='\"', na.strings="?"
                        ,check.names=F, nrows=2075259)
powerdata<-subset(householddata, Date %in% c("1/2/2007","2/2/2007"))
powerdata$Date<-as.Date(powerdata$Date,format="%d/%m/%y")
datetime <- paste(as.Date(powerdata$Date), powerdata$Time)
powerdata$Datetime <- as.POSIXct(datetime)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(powerdata, {
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
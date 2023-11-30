library(lubridate)
library(dplyr)
path<-"C:\\Users\\rajne\\OneDrive\\Desktop\\DataScience-specialisation\\Course-4(Exploratory Data Analysis)\\Project-1\\household_power_consumption.txt"
df<-read.table(path,header = TRUE,sep=";")
df <- subset(df,df$Date=="1/2/2007" | df$Date =="2/2/2007")


df$Time <- as.POSIXct(paste(df$Date,df$Time),format = "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, format="%d/%m/%Y")



png("plot4.png", width =  480, height = 480)

par(mfrow=c(2,2),mar=c(5,4,2,1))
  plot(df$Time,as.numeric(df$Global_active_power),xaxt="n",type="l",  xlab="",ylab="Global Active Power")  
  axis(1,at=df$Time,gap.axis = 7,labels = weekdays(df$Time))
  
  plot(df$Time,as.numeric(df$Voltage), type="l",xaxt="n",xlab="datetime",ylab="Voltage")
  axis(1,at=df$Time,gap.axis = 7,labels = weekdays(df$Time))
  
   plot(df$Time,as.numeric(df$Sub_metering_1),xaxt="n",type="n",xlab="",ylab="Energy sub metering")
   axis(1,at=df$Time,gap.axis = 7,labels = weekdays(df$Time))
   
   with(df,lines(df$Time,as.numeric(df$Sub_metering_2)),col="red")
  with(df,lines(df$Time,as.numeric(df$Sub_metering_3),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(df$Time,as.numeric(df$Global_reactive_power),xaxt="n",type="l",xlab="datetime",ylab="Global_reactive_power")
  axis(1,at=df$Time,gap.axis = 7,labels = weekdays(df$Time))
  

dev.off()
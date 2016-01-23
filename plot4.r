file<-"C:/Users/Ahuaflower/Desktop"
##save in the working directory

setwd(file)
library(dplyr)
library(datasets)

data<-read.csv("household_power_consumption.txt",header=TRUE,sep=";")
subData<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
subData[subData=="?"]<-NA


for(i in 3:9){
  subData[,i]<-as.numeric(subData[,i])  
}

Date<-as.character(subData$Date)
Time<-paste(as.character(subData$Time),Date)
Time<-strptime(Time,"%H:%M:%S %d/%m/%Y",)
Sys.setlocale("LC_TIME", "English")

par(mfrow=c(2,2))
plot(Time,subData$Global_active_power/500,type="l",ylab = "Global Active Power (kilowatts)",xlab="")

plot(Time,subData$Voltage/10,type="l",ylab = "Voltage",xlab="datetime")

plot(Time,subData$Sub_metering_1,type="n",ylab="Energy sub metering")
lines(Time,subData$Sub_metering_1)
lines(Time,subData$Sub_metering_2,type="l",col="red")
lines(Time,subData$Sub_metering_3,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.5)

plot(Time,subData$Global_reactive_power/500,type="l",ylab = "Global_reactive_power",xlab="")
dev.copy(png,file="plot4.png")
dev.off()
par(mfrow=c(1,1))

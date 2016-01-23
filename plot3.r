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

plot(Time,subData$Sub_metering_1,type="n",ylab="Energy sub metering")
lines(Time,subData$Sub_metering_1)
lines(Time,subData$Sub_metering_2,type="l",col="red")
lines(Time,subData$Sub_metering_3,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file="plot3.png")
dev.off()

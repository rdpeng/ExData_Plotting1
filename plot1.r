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

#plot1
hist(subData$Global_active_power/500,col="red",main = "Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png")
dev.off()


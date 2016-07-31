##Project 1 by MengnanShi

setwd("F:/Coursera/Data Science/4. Exploratory Data Analysis/Projects 1")
getwd()

#read the data into R
DATA<-read.table("./household_power_consumption.txt",blank.lines.skip=TRUE,strip.white=TRUE,header=TRUE,sep=";",na.strings="?")
Household_Power<-DATA
str(Household_Power)
head(Household_Power)

#class date/time format
Household_Power$Date<-as.Date(Household_Power$Date,"%d/%m/%Y")
Household_Power$Time<-paste(Household_Power$Date,Household_Power$Time)
Household_Power$Time<-strptime(Household_Power$Time,format="%Y-%m-%d %H:%M:%S")
head(Household_Power)
tail(Household_Power)

#choose dates 2007-02-01 and 2007-02-02
Household_Power_Final<-Household_Power[Household_Power$Date=="2007-02-01" | Household_Power$Date=="2007-02-02",]

##Plot.4
dev.new()
par(mfrow=c(2,2))
#1
with(Household_Power_Final,plot(Time,Global_active_power,type="l",ylab="Global Active Power",xlab=""))
#2
with(Household_Power_Final,plot(Time,Voltage,type="l",ylab="Volgate",xlab="datetime"))
#3
with(Household_Power_Final,plot(Time,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
lines(Household_Power_Final$Time,Household_Power_Final$Sub_metering_2,col="red")
lines(Household_Power_Final$Time,Household_Power_Final$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1)
#4
with(Household_Power_Final,plot(Time,Global_reactive_power,type="l",ylab=" Global_reactive_power",xlab="datetime"))
dev.copy(png,file="./plot4.png",width = 480, height = 480,bg="white")
dev.off()

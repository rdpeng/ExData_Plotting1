#Set the Working Directory:
setwd("C:\\Users\\EduRDO\\Desktop\\Coursera\\Especialização Ciencia de Dados\\4 - Exploratory Data Analysis\\Projeto 1\\exdata-data-household_power_consumption")

#Load the whole dataset in R wholeds(Whole Data Set))
wholeds<-read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

#Convert the first column of wholeds to Date
wholeds$Date<-as.Date(wholeds$Date,format="%d/%m/%Y")

#Subset the dataset to the epcds (electric power consumption dataset) dataset
epcds<-wholeds[(wholeds$Date=="2007-02-01"|wholeds$Date=="2007-02-02"),]

#Convert the second column of the dataset to time
epcds$Time<-paste(epcds$Date,epcds$Time,sep="")
epcds$Time<-strptime(epcds$Time,format = "%Y-%m-%d %H:%M:%S")

#Plot 4:
par(mfrow=c(2,2))
with(epcds,plot(x=Time,y=Global_active_power,xlab="",ylab="Global Active Power",type="l"))
with(epcds,plot(x=Time,y=Voltage,xlab="",type="l"))

with(epcds,plot(x=epcds$Time,y=epcds$Sub_metering_1,ylab="Energy sub metering",xlab="",type="n"))
with(epcds,lines(x=Time,y=Sub_metering_1,lty="solid"))
with(epcds,lines(x=Time,y=Sub_metering_2,lty="solid",col="red"))
with(epcds,lines(x=Time,y=Sub_metering_3,lty="solid",col="blue"))
legend(x="topright", lty = "solid", col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),bty="n")


with(epcds,plot(x=Time,y=Global_reactive_power,xlab="datetime",type="l"))
dev.copy(png,file="plot4.png")
dev.off()
 
  

#getting the data
#I am being lazy here to gain time and looked up the row numbers t
#that forces me to import the list name with a quite inelegant method
#I use a vector to reassign the different columns name
dataraw <- read.delim("household_power_consumption.txt", sep = ";", dec = ".", skip=66636,nrows=2880, na.strings = "?")
dataname <- read.delim("household_power_consumption.txt", sep = ";", dec = ".",nrows=1, na.strings = "?")
vecnames<-names(dataname)
names(dataraw)<- vecnames
#making a copy not to destroy the raw data
#it helped me with troubleshooting what was going wrong
dataclean <-dataraw
#creating a time 
dataclean$FTime <- paste(dataclean$Date,dataclean$Time )
dataclean$FTime <- strptime(dataclean$FTime, format = "%d/%m/%Y %H:%M:%S")
#Here comes the plots
plot(dataclean$FTime,dataclean$Sub_metering_1,ylab="Energy sub metering",xlab="",type="l")
with(dataclean,points(FTime,Sub_metering_2,col="red",type="l"))
with(dataclean,points(FTime,Sub_metering_3,col="blue",type="l"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
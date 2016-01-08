household <-read.table( "C:/coursera/datatoolbox/exploreData/household.txt",  sep = ";", fill=TRUE)
names(household)[1]=paste("Date")
names(household)[2]=paste("Time")
names(household)[3]=paste("Global_active_power")
names(household)[4]=paste("Global_reactive_power")
names(household)[5]=paste("Voltage")
names(household)[6]=paste("Global_intensity")
names(household)[7]=paste("Sub_metering_1")
names(household)[8]=paste("Sub_metering_2")
names(household)[9]=paste("Sub_metering_3")

household[,1]<-as.Date(household[,1],"%d/%m/%Y")



 houseSet <-household$Date>="2007-02-01"&household$Date <"2007-02-03"
 
h<-cbind(strptime(paste(household$Date,household$Time),"%Y-%m-%d %H:%M:%S"),household) 

names(h)[1]=paste("datetime")


png(file= "plot4.png", width=480, height =480)
par(mfrow = c(2,2))
with(data,{
plot(h$datetime,as.numeric(as.character(h$Global_active_power)),type="l",ylab="Global Active Power",xlab="")
plot(h$datetime,as.numeric(as.character(h$Voltage)),type="l",ylab="Voltage",xlab="")
plot(h$datetime,as.numeric(as.character(h$Sub_metering_1)),type="l",ylab= "Energy sub metering",xlab="")
lines(h$datetime,as.numeric(as.character(h$Sub_metering_2)),type="l",col= "red")
lines(h$datetime,as.numeric(as.character(h$Sub_metering_3)),type="l",col= "blue")
plot(h$datetime,as.numeric(as.character(h$Global_reactive_power)),type="l",ylab="Global_reactive_power",xlab="")
})



dev.off() 
 
 
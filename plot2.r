power<-read.table(file="cour/explo/first proj/household_power_consumption.txt", sep=";",header=TRUE)
power<-subset(power,power$Date=="1/2/2007"|power$Date=="2/2/2007")
power$full_date<-as.POSIXlt(strptime(paste(power$Date,power$Time,sep=" "),"%d/%m/%Y %H:%M:%S"))
power$Global_active_power<-as.numeric(power$Global_active_power)
power$Global_reactive_power<-as.numeric(power$Global_reactive_power)
power$Voltage<-as.numeric(power$Voltage)


### Date: Date in format dd/mm/yyyy
### Time: time in format hh:mm:ss

#### global active power graph -> plot2
png("plot2.png",width=480,height=480)

plot(x=power$full_date,y=power$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=NA)

dev.off()

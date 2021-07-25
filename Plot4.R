#plot4
# Reading, naming and subsetting power consumption data
power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
subpower[1:1440,"Time"] <- format(subpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower[1441:2880,"Time"] <- format(subpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# initiating a composite plot with many graphs
par(mfrow=c(2,2))

# calling the basic plot function that calls different plot functions to build the 4 plots that form the graph
pdf(file = "plot4")
with(subpower,{
  plot(subpower$Time,as.numeric(as.character(subpower$Global_active_power)),type="l",  xlab="Time",ylab="Global Active Power", col = "red")  
  plot(subpower$Time,as.numeric(as.character(subpower$Voltage)), type="l",xlab="Time",ylab="Voltage", col = "purple")
  plot(subpower$Time,subpower$Sub_metering_1,type="n",xlab="Time",ylab="Energy sub metering")
  with(subpower,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(subpower,lines(Time,as.numeric(as.character(Sub_metering_2)),col="green"))
  with(subpower,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","green","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(subpower$Time,as.numeric(as.character(subpower$Global_reactive_power)),type="l",xlab="Time",ylab="Global_reactive_power", col = "pink")
})
dev.off()
dev.copy(png, file = "plot4")



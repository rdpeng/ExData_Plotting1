# read the raw data
power_data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

# subset the data
power_data2<-subset(power_data,Date=="1/2/2007"|Date=="2/2/2007")

# convert particular columns into numeric
power_data2$Sub_metering_1<-as.numeric(as.character(power_data2$Sub_metering_1))
power_data2$Sub_metering_2<-as.numeric(as.character(power_data2$Sub_metering_2))
power_data2$Sub_metering_3<-as.numeric(as.character(power_data2$Sub_metering_3))
power_data2$Voltage<-as.numeric(as.character(power_data2$Voltage))
power_data2$Global_reactive_power<-as.numeric(as.character(power_data2$Global_reactive_power))

# I want to use datetime format...
times<-as.character(power_data2$Time)
dates<-as.character(power_data2$Date)
x <- paste(dates, times)

# Let's create a new column in power_data2 with datetime info
power_data2$Date_time<-strptime(x, "%d/%m/%Y %H:%M:%S")

# Open the graphic device
png("plot4.png")

# Create a grid for figures
par(mfrow = c(2,2))

# Add plots...
with(power_data2,with(power_data2, plot(Date_time,Global_active_power,type="l",xlab="",ylab="Global Active Power")))
with(power_data2, plot(Date_time,Voltage,type="l",xlab="datetime",ylab="Voltage"))
with(power_data2, plot(Date_time,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(power_data2, lines(Date_time,Sub_metering_2,col="red"))
with(power_data2, lines(Date_time,Sub_metering_3,col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,lwd=2,bty="n")
with(power_data2, plot(Date_time,Global_reactive_power,type="l",xlab="datetime"))
dev.off()

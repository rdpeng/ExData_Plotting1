# Set working directory to the folder where data is located.
setwd("C:/Project 1")

# Read the data and set the class of date as date.
dt<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
dt[,1]<-as.Date(dt[,1],"%d/%m/%Y")

# Create a new data table where dates are only 2007-02-01 and 2007-02-02,
# and combine date and time together.
dt<-rbind(dt[as.Date(dt[,1])=="2007-02-01",],dt[as.Date(dt[,1])=="2007-02-02",])
Date_Time<-strptime(paste(dt[,1],dt[,2]), "%Y-%m-%d %H:%M:%S")

# Create a new data table for plotting.
dt<-cbind(Date_Time,dt[,c(3:9)]) 

# Call "png" graphic device and save the plot as "plot4.png".
png(file="plot4.png")

# Set plot global background colour as "transparent", create the chart as
# 2 rows by 2 columns array chart, and magnify text and symbols to 0.8 of
# default values.
par(bg="transparent",mfcol=c(2,2),cex=0.8)

# Plot the "Global active power" chart on the top left corner.
plot(dt$Date_Time,dt$Global_active_power,xlab="",ylab="Global Active Power",type="n")
lines(dt$Date_Time,dt$Global_active_power)

# Plot the "Energy sub metering" chart on the bottom left corner.
plot(dt$Date_Time,dt$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
lines(dt$Date_Time,dt$Sub_metering_1,col="black")
lines(dt$Date_Time,dt$Sub_metering_2,col="red")
lines(dt$Date_Time,dt$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),bty="n",lty=c(1,1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Plot the "Voltage" chart on the top right corner.
plot(dt$Date_Time,dt$Voltage,xlab="datetime",ylab="Voltage",type="n")
lines(dt$Date_Time,dt$Voltage)

# Plot the "Global reactive power" chart on the bottom right corner.
plot(dt$Date_Time,dt$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="n")
lines(dt$Date_Time,dt$Global_reactive_power)

# Turn off the graph

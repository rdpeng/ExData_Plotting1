#---Download File
setInternet2(TRUE) 
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
data=read.table(unzip("household_power_consumption.zip"),sep = ";", header = FALSE, skip =1)
names(data) = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
dataSub=subset(data,data$Date =="1/2/2007" | data$Date == "2/2/2007")

#---Provide required variables
dataSub$Sub_metering_1=as.numeric(as.character(dataSub$Sub_metering_1))
dataSub$Sub_metering_2=as.numeric(as.character(dataSub$Sub_metering_2))
dataSub$Sub_metering_3=as.numeric(as.character(dataSub$Sub_metering_3))

dateTime=paste(dataSub$Date, dataSub$Time)
dateTime=strptime(dateTime,"%d/%m/%Y %H:%M:%S")

#----plot 3
with(dataSub,plot(dateTime,Sub_metering_1,xlab=" ",ylab = "Energy sub metering",type = "n"))
with(subset(dataSub),lines(dateTime,Sub_metering_1,ylab = "Energy sub metering", col = "black"))
with(subset(dataSub),lines(dateTime,Sub_metering_2,col = "red"))
with(subset(dataSub),lines(dateTime,Sub_metering_3,col = "blue"))
legend("topright",lty = c(1,1,1) ,col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file ="plot3.png", width=480, height=480)
dev.off()


#---Download File
setInternet2(TRUE) 
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
data=read.table(unzip("household_power_consumption.zip"),sep = ";", header = FALSE, skip =1)
names(data) = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
dataSub=subset(data,data$Date =="1/2/2007" | data$Date == "2/2/2007")

#---Provide required variables
dataSub$Global_active_power=as.numeric(as.character(dataSub$Global_active_power))
dateTime=paste(dataSub$Date, dataSub$Time)
dateTime=strptime(dateTime,"%d/%m/%Y %H:%M:%S")

#----plot 2
plot(dateTime,dataSub$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file ="plot2.png", width=480, height=480)
dev.off()
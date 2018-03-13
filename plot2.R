##que2
# Reading and subsetting power consumption data
data<-read.table("household_power_consumption.txt",header = TRUE,sep = ";")
data1 <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
data1$Time <- strptime(data1$Time, format="%H:%M:%S")
data1[1:1440,"Time"] <- format(data1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data1[1441:2880,"Time"] <- format(data1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# calling the basic plot function
plot(data1$Time,as.numeric(as.character(data1$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# annotating graph
title(main="Global Active Power Vs Time")

png("plot2.png", width=480, height=480)
dev.off()

#Reading and subsetting power consumption data
data<-read.table("household_power_consumption.txt",header = TRUE,sep = ";")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data1 <- subset(data,data$Date=="2007-02-01" | data$Date =="2007-02-02")

#calling the basic plot function
hist(as.numeric(as.character(data1$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

# annotating graph
title(main="Global Active Power")

png("plot1.png", width=480, height=480)
dev.off()


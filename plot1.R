hpc<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),colClasses=c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings = c("?","NA"))
in_date_range<-(hpc$Date=='1/2/2007' | hpc$Date=='2/2/2007')
hpc_to_use<-hpc[in_date_range,]

png("plot1.png", width=480, height=480)
hist(hpc_to_use$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off()

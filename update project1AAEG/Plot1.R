##reading only rows of interest - 01/02/2007-00:00 to 02/02/2007-23:59

powerplot1<-read.table("./household_power_consumption.txt", skip=66637,nrows=2880, header=F,sep=";",na.string=c("?"), comment.char="")

##renaming variables with the original names

colnames(powerplot1)<-read.table("./household_power_consumption.txt",nrows=1,header=F,sep=";")

## changing names
> names(powerplot1)=c("Date","Time", "Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3" )

####PLOT1
png("plot1.png", width=480, height=480)
hist(powerplot1$Global_active_power,xlab="Global Active Power(kilowatts)",ylab="Frequency",main="Global Active Power",col="red")
dev.off()

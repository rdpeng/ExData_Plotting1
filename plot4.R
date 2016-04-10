setwd('./ExData_Plotting1')
#read data for Exercise 1 into memory
init <- read.table('household_power_consumption.txt',nrows=100,sep=';',header=TRUE,na.strings='?',stringsAsFactors=FALSE)
classes <- sapply(init,class)
full <- read.table('household_power_consumption.txt',colClasses=classes,sep=';',header=TRUE,na.strings='?',stringsAsFactors=FALSE)
full$newdate <- as.Date(full$Date, "%d/%m/%Y")
full$datetime <- strptime(paste(full$Date,full$Time),'%d/%m/%Y %H:%M:%S')

subset <- subset(full,newdate>='2007-02-01' & newdate<='2007-02-02')

#plot 4
par(mfrow=c(2,2))
plot(subset$datetime,subset$Global_active_power,type='l',xlab='datetime',ylab="Global Active Power(kilowatts)")
plot(subset$datetime,subset$Voltage,type='l',xlab='datetime',ylab="Voltage")
plot(subset$datetime,subset$Sub_metering_1,type='l',xlab='datetime',ylab="Energy sub metering")
lines(subset$datetime,subset$Sub_metering_2,type='l',col='red')
lines(subset$datetime,subset$Sub_metering_3,type='l',col='blue')
plot(subset$datetime,subset$Global_reactive_power,type='l',xlab='datetime',ylab="Global Reactive Power(kilowatts)")

dev.copy(png,'myplot4.png')
dev.off()


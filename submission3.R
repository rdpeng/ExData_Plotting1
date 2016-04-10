setwd('./ExData_Plotting1')
#read data for Exercise 1 into memory
init <- read.table('household_power_consumption.txt',nrows=100,sep=';',header=TRUE,na.strings='?',stringsAsFactors=FALSE)
classes <- sapply(init,class)
full <- read.table('household_power_consumption.txt',colClasses=classes,sep=';',header=TRUE,na.strings='?',stringsAsFactors=FALSE)
full$newdate <- as.Date(full$Date, "%d/%m/%Y")
full$datetime <- strptime(paste(full$Date,full$Time),'%d/%m/%Y %H:%M:%S')

subset <- subset(full,newdate>='2007-02-01' & newdate<='2007-02-02')

#plot 3
plot(subset$datetime,subset$Sub_metering_1,type='l',xlab='datetime',ylab="Energy sub metering")
lines(subset$datetime,subset$Sub_metering_2,type='l',col='red')
lines(subset$datetime,subset$Sub_metering_3,type='l',col='blue')
dev.copy(png,'myplot3.png')
dev.off()
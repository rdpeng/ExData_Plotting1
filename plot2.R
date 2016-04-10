setwd('./ExData_Plotting1')
#read data for Exercise 1 into memory
init <- read.table('household_power_consumption.txt',nrows=100,sep=';',header=TRUE,na.strings='?',stringsAsFactors=FALSE)
classes <- sapply(init,class)
full <- read.table('household_power_consumption.txt',colClasses=classes,sep=';',header=TRUE,na.strings='?',stringsAsFactors=FALSE)
full$newdate <- as.Date(full$Date, "%d/%m/%Y")
full$datetime <- strptime(paste(full$Date,full$Time),'%d/%m/%Y %H:%M:%S')

subset <- subset(full,newdate>='2007-02-01' & newdate<='2007-02-02')

#plot 2
plot(subset$datetime,subset$Global_active_power,type='l',xlab="datetime",ylab="Global Active Power(kilowatts)")
dev.copy(png,'myplot2.png')
dev.off()


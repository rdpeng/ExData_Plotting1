setwd('./ExData_Plotting1')
#read data for Exercise 1 into memory
init <- read.table('household_power_consumption.txt',nrows=100,sep=';',header=TRUE,na.strings='?',stringsAsFactors=FALSE)
classes <- sapply(init,class)
full <- read.table('household_power_consumption.txt',colClasses=classes,sep=';',header=TRUE,na.strings='?',stringsAsFactors=FALSE)
full$newdate <- as.Date(full$Date, "%d/%m/%Y")
full$datetime <- strptime(paste(full$Date,full$Time),'%d/%m/%Y %H:%M:%S')

subset <- subset(full,newdate>='2007-02-01' & newdate<='2007-02-02')

#plot 1
hist(subset$Global_active_power,xlab='Global Active Power(kilowatts)',ylab='Frequency',main='Global Active Power',col='red')
dev.copy(png,'myplot1.png')
dev.off()
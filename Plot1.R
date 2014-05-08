#use data from the dates 2007-02-01 and 2007-02-02
temp=read.table('household_power_consumption.txt',nrows=2,sep=";",header=TRUE)
names=names(temp)
#	grep -n '^1/2/2007' household_power_consumption.txt |cut -d: -r 1
#	gives 66638 as first line number on which desired data is located
# 	s0 skipping 66637 rows.
#	The data is taken every minute, every hour, every day.  So, we want two days worth of data (48*60) or 2880 rows.
data=read.table('household_power_consumption.txt',skip =66637, nrows=2880,sep=";",col.names=names)
summary(data)
names(data)
#Date                  Time                  Global_active_power  
#Global_reactive_power Voltage               Global_intensity     
#Sub_metering_1        Sub_metering_2        Sub_metering_3   
data$Time=strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
data$Time=strptime(data$Time),format="%d/%m/%Y %H:%M:%S")
data$Date=strptime(data$Date,format="%d/%m/%Y")
head(data)

png("Plot1.png",width=480,height=480)
with(data,hist(Global_active_power,xlab="Global Active Power (kilowatts)",col='red',main="Global Active Power"))
dev.off()
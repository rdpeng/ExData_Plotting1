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

rng=with(data,c(min(Sub_metering_1,Sub_metering_2,Sub_metering_3),max(Sub_metering_1,Sub_metering_2,Sub_metering_3)))
png("Plot3.png",width=480,height=480)
with(data,plot(Time,Global_active_power,type='n',ylab="Energy Sub Metering",ylim=rng))
with(data,points(Time, Sub_metering_1,pch='l',col='black'))
with(data,points(Time, Sub_metering_2,pch='l',col='red'))
with(data,points(Time, Sub_metering_3,pch='l',col='blue'))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lwd=5,cex=0.75)

dev.off()
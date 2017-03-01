setwd('C:/Users/Jeffrey/Desktop/Coursera/Power Consumption')
unzip('exdata%2Fdata%2Fhousehold_power_consumption.zip')
StageIn   <- read.table('household_power_consumption.txt',header=TRUE,dec='.',sep=';',stringsAsFactors=FALSE)
Transform <- StageIn[StageIn$Date %in% c('1/2/2007','2/2/2007') ,]
df <- as.data.frame(Transform)	

df <- subset(df,Sub_metering_1 != '?')  
df <- subset(df,Sub_metering_2 != '?')  
df <- subset(df,Sub_metering_3 != '?')  


pasted <- paste(df$Date , df$Time , sep = '')
datetime <- strptime(pasted, '%d/%m/%Y %H:%M:%S') 

png('plot4.png', width=480, height=480)

par(mfrow=c(2,2))


with(df , {

##plot 1
plot(datetime,as.numeric(Global_active_power),type= 'l',xlab='',ylab='Global Active Power(kilowatts)')

##plot 2
plot(datetime,as.numeric(df$Voltage),type='l',ylab='Voltage')

##plot 3
with(df,plot(datetime,as.numeric(Sub_metering_1) , type = 'n',ylab='Energy sub metering',xlab=''))
lines(datetime,as.numeric(df$Sub_metering_1),col='Darkgrey')
lines(datetime,as.numeric(df$Sub_metering_2),col='red')
lines(datetime,as.numeric(df$Sub_metering_3),col='blue')	
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1, lwd=2.5, col=c('darkgrey', 'red', 'blue'))

##plot 4
plot(datetime,as.numeric(df$Global_reactive_power),type='l',ylab='Global_reactive_power')

})


dev.off()


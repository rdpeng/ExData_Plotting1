
require(data.table)
temp <- tempfile()
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',temp)
power  <- fread(unzip(temp, "household_power_consumption.txt"), sep = ';', header = TRUE)
unlink(temp)
power <- power[power$Date == '1/2/2007' | power$Date == '2/2/2007',]

power$wd <-weekdays(as.Date(power$Date,'%m/%d/%Y'))
power <-power[order(power$wd ,decreasing = TRUE),]
power$ID <- seq(from = 1, to =2880)
plotlabels <- data.frame(y = c(0.326,0.326,0.326),x = c('Thu','Fri','Sat'), ID = c(1,1440,2880))
par( mar = c(5,5,1,1 ))
png("plot4.png", width= 800, height= 800, units="px", res=100)
par(mfrow=c(2,2))
plot(power$ID,as.numeric(power$Global_active_power), type = 'l' , ylab ="Global Active Power"  ,xlab = ''      ,axes = TRUE ,xaxt='n')
axis(1, at = plotlabels$ID , labels = c('Thu','Fri','Sat')) 
plot(power$ID,as.numeric(power$Voltage), type = 'l' , ylab ="Voltage"  ,xlab = 'datetime'      ,axes = TRUE ,xaxt='n')
axis(1, at = plotlabels$ID , labels = c('Thu','Fri','Sat')) 
plot(power$ID,power$Sub_metering_1, type = 'l' , ylab ="Energy sub metering"  ,xlab = '' ,axes = TRUE ,xaxt='n')
lines(power$ID,power$Sub_metering_2, type = 'l' , col = 'red')
lines(power$ID,power$Sub_metering_3, type = 'l' , col = 'blue')
axis(1, at = plotlabels$ID , labels = c('Thu','Fri','Sat')) 
legend("topright", 
       legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),  col=c("black","red","blue"),
       lwd=1, lty=c(1,1,1),pch=c(NA,NA,NA),  cex = 0.75) 
plot(power$ID,as.numeric(power$Global_reactive_power), type = 'l' , ylab ="Global_reactive_power"  ,xlab = 'datetime'      ,axes = TRUE ,xaxt='n')
axis(1, at = plotlabels$ID , labels = c('Thu','Fri','Sat')) 
dev.off()
 
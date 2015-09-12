require(data.table)

temp <- tempfile()
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',temp)
power  <- fread(unzip(temp, "household_power_consumption.txt"), sep = ';', header = TRUE)
unlink(temp)
power <- power[power$Date == '1/2/2007' | power$Date == '2/2/2007',]



Plot3data <-data.frame(y1 = as.numeric(power$Sub_metering_1), y2 = as.numeric(power$Sub_metering_2), y3= as.numeric(power$Sub_metering_3), x = weekdays(as.Date(power$Date,'%m/%d/%Y')))
Plot3data <-Plot3data[order(Plot3data$x,decreasing = TRUE),]
Plot3data$ID <- seq(from = 1, to =2880)
Plot3datalabels <- data.frame(y = c(0.326,0.326,0.326),x = c('Thu','Fri','Sat'), ID = c(1,1440,2880))
par( mar = c(5,4,1,1 ))
png("plot3.png", width=480, height=480, units="px", res=100)
plot(Plot3data$ID,Plot3data$y1, type = 'l' , ylab ="Energy sub metering"  ,xlab = '' ,axes = TRUE ,xaxt='n')
lines(Plot3data$ID,Plot3data$y2, type = 'l' , col = 'red')
lines(Plot3data$ID,Plot3data$y3, type = 'l' , col = 'blue')
axis(1, at = Plot3datalabels$ID , labels = c('Thu','Fri','Sat')) 
legend("topright", 
       legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),  col=c("black","red","blue"),
       lwd=1, lty=c(1,1,1),pch=c(NA,NA,NA),  cex = 0.75)
dev.off()
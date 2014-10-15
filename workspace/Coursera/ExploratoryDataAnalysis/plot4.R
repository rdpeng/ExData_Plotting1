#Project01
#plot4.R
#make fourth plot

# read in the data and select data for plotting
source("plot1.R")
setwd(plotDir) # plotDir set in plot1.R

# the whole data set is stored in power
# the data selected is now stored in the variable: powerDates

#make four plots on same .png image
png(file="plot4.png",width=480,height=480)

par(mfcol = c(2, 2))
# plot like plot2
plot(powerDates$Time,powerDates$Global_active_power,axes=FALSE,
     ylab="Global Active Power (kilowatts)",
     xlab = weekdays(dates(as.character(powerDates$Date))))
axis(1,at=weekdays(dates(as.character(powerDates$Date))))
axis(2)
box()

#plot like plot3
plot(powerDates$Time,powerDates$Sub_metering_1,axes=FALSE,
     ylab="Energy sub metering",
     xlab = weekdays(dates(as.character(powerDates$Date))))
axis(1,at=weekdays(dates(as.character(powerDates$Date))))
axis(2)
box()
lines(powerDates$Time,powerDates$Sub_metering_2,col="red")
lines(powerDates$Time,powerDates$Sub_metering_3,col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       cex=0.5,pch="___", col=c("black","red","blue"),
       bty="n")#,inset = .02)

plot(powerDates$Time,powerDates$Voltage,axes=FALSE,
     ylab="Voltage",
     xlab = weekdays(dates(as.character(powerDates$Date))))
axis(1,at=weekdays(dates(as.character(powerDates$Date))))
axis(2)
mtext("datetime",side = 1,line = 2)
box()

plot(powerDates$Time,powerDates$Global_reactive_power,axes=FALSE,
     ylab="Global_Reactive_Power",
     xlab = weekdays(dates(as.character(powerDates$Date))))
axis(1,at=weekdays(dates(as.character(powerDates$Date))))
axis(2)
mtext("datetime",side = 1,line = 2)
box()
#

#dev.off()
#return to original directory
setwd(myDir)

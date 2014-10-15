#Project01
#plot3.R
#make third plot

# read in the data and select data for plotting
source("plot1.R")
setwd(plotDir) # plotDir set in plot1.R

# the whole data set is stored in power
# the data selected is now stored in the variable: powerDates

#make the plot
png(file="plot3.png",width=480,height=480)

plot(powerDates$Time,powerDates$Sub_metering_1,axes=FALSE,
     ylab="Energy sub metering",
     xlab = weekdays(dates(as.character(powerDates$Date))))
axis(1,at=weekdays(dates(as.character(powerDates$Date))))
axis(2)
box()
lines(powerDates$Time,powerDates$Sub_metering_2,col="red")
lines(powerDates$Time,powerDates$Sub_metering_3,col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       pch="___", col=c("black","red","blue"),inset = .02)
#
dev.off()
#return to original directory
setwd(myDir)

#Project01
#plot2.R
#make second plot

# read in the data and select data for plotting
source("plot1.R")
setwd(plotDir) # plotDir set in plot1.R

# the whole data set is stored in power
# the data selected is now stored in the variable: powerDates

# set up the time variable using strptime() and as.Date() 
# %a returns day of week

# dayName <- strptime(dates(powerDates$Date),format = "%d%b%Y")  #check
# dayName[1]
# dayName[length(dayName)]

# check calculation for day of week
weekdays(dates(as.character(powerDates$Date[1])))

#plot something to the screen
plot(1:3,1:3)

#make the plot
png(file="plot2.png",width=480,height=480)

plot(powerDates$Time,powerDates$Global_active_power,axes=FALSE,
     ylab="Global Active Power (kilowatts)",
     xlab = weekdays(dates(as.character(powerDates$Date))))
axis(1,at=weekdays(dates(as.character(powerDates$Date))))
axis(2)
box()
#
dev.off()
#plot something to the screen
plot(1:3,1:3)
#return to original directory
setwd(myDir)

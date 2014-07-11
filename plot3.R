# Read Data
# read the data from previous file (ReadProcessData.R)
# dsub is the data name
load("household_power_consumption_reduced.RData")

# Create the png graph file

#plot 3
png(file = "plot3.png")
par(mfrow = c(1,1)) #add within the png context
maxvals=range(c(dsub$Sub_metering_1,dsub$Sub_metering_2,dsub$Sub_metering_3))
plot(dsub$DateTime,dsub$Sub_metering_1,main="Global Active Power",type="l",col="black",ylab="Energy sub metering",xlab="",ylim=maxvals)
lines(dsub$DateTime,dsub$Sub_metering_2,col="red")
lines(dsub$DateTime,dsub$Sub_metering_3,col="blue")
legend("topright", pch = 1, col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))     
dev.off()



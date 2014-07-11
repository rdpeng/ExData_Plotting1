# Read Data
# read the data from previous file (ReadProcessData.R)
# dsub is the data name
load("household_power_consumption_reduced.RData")

# Create the png graph file

png(filename="plot1.png",width=480,height=480)
par(mfrow = c(1,1)) #add within the png context
#plot 1
hist(dsub$Global_active_power,main="Global Active Power",
     col="red",ylab="Frequency",
     xlab="Global Active Power(kilowatts)")
dev.off()

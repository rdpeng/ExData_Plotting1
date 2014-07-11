# Read Data
# read the data from previous file (ReadProcessData.R)
# dsub is the data name
load("household_power_consumption_reduced.RData")

# Create the png graph file

#plot 2
png(filename="plot2.png",width=480,height=480)
par(mfrow = c(1,1)) #add within the png context

with (dsub,plot(DateTime,Global_active_power,main="Global Active Power",type="l"
                ,col="black",ylab="Global Active Power(kilowatts)"),xlab="")
dev.off()

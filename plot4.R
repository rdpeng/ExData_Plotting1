# Read Data
# read the data from previous file (ReadProcessData.R)
# dsub is the data name
load("household_power_consumption_reduced.RData")

# Create the png graph file

#plot 4
png(file = "plot4.png")
par(mfrow = c(2, 2)) #add within the png context
with(dsub, {
  plot(DateTime,Global_active_power,col="black",type="l", ylab= "Global Active Power",xlab="")
  plot(DateTime,Voltage,type="l", ylab= "Voltage",col="black",xlab="datetime")
  plot(DateTime,Sub_metering_1,type="l"
       ,col="black",ylab="Energy sub metering",xlab="")
  lines(DateTime,Sub_metering_2,col="red")
  lines(DateTime,Sub_metering_3,col="blue")
  legend("topright", pch = 1, col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))     
  plot(DateTime,Global_reactive_power,col="black",type="l", ylab= "Global Reactive Power",xlab="datetime")
  
})
dev.off()

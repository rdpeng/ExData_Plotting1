# Read in the data
classDef = c(c(NA,NA),rep("character",7))
hpc = read.csv("household_power_consumption.txt",sep = ';',colClasses = classDef)
hpcfile = subset(hpc, subset = (Date == "1/2/2007" | Date == "2/2/2007"))
# copy board for test codes
for (i in 3:9){
  hcfile = as.numeric(hpcfile[[i]])
}
row.names(hpcfile) = 1:2880

## Plot the data in four blocks
# Plot the data in the file
png(filename = "plot4.bmp",width = 480, height = 480)
par(mfrow = c(2, 2),mar = c(4, 4, 2, 1))

# The first plot
plot(1:2880, hpcfile$Global_active_power,type = 'l',
     ylab = 'Global Active Power (kilowatts)',xlab = 'datetime',xaxt = "n")
axis(side = 1,at = c(0,1441,2880),labels = c("Thu","Fri","Sat"))

# The second plot
plot(1:2880, hpcfile$Voltage,type = 'l',ylab = 'Voltage',
     xlab = 'datetime',xaxt = "n")
axis(side = 1,at = c(0,1441,2880),labels = c("Thu","Fri","Sat"))

# The thrid plot
plot(1:2880,hpcfile$Sub_metering_1,
type = 'l',col = 'black',ylab = "Energy sub metering",
xlab = 'datetime',xaxt = "n")
points(1:2880,hpcfile$Sub_metering_2,type = 'l',col = 'red')
points(1:2880,hpcfile$Sub_metering_3,type = 'l',col = 'blue')
axis(side = 1,at = c(0,1441,2880),labels = c("Thu","Fri","Sat"))
legend("topright", lty = 1, col = c("black","red","blue"), 
       legend = c("Sub_metering1","Sub_metering2","Sub_metering3"))

# The fourth plot
plot(1:2880, hpcfile$Global_reactive_power,
     type = 'l',col = 'black',ylab = "Global reactive power",
     xlab = 'datetime',xaxt = "n")
axis(side = 1,at = c(0,1441,2880),labels = c("Thu","Fri","Sat"))
dev.off()



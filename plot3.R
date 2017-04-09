# Read in the data
classDef = c(c(NA,NA),rep("character",7))
hpc = read.csv("household_power_consumption.txt",sep = ';',colClasses = classDef)
hpcfile = subset(hpc, subset = (Date == "1/2/2007" | Date == "2/2/2007"))
# copy board for test codes
for (i in 1:3){
        hpcfile[sprintf("Sub_metering_%d",i)] = 
          as.numeric(hpcfile[[sprintf("Sub_metering_%d",i)]])
}

# Plot the data in the file
png(filename = "plot3.bmp",width = 480, height = 480)
row.names(hpcfile) = 1:2880
plot(1:2880,hpcfile$Sub_metering_1,
     type = 'l',col = 'black',ylab = "Energy sub metering",
     xlab = "",xaxt = "n")
points(1:2880,hpcfile$Sub_metering_2,type = 'l',col = 'red')
points(1:2880,hpcfile$Sub_metering_3,type = 'l',col = 'blue')
axis(side = 1,at = c(0,1441,2880),labels = c("Thu","Fri","Sat"))
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering1","Sub_metering2","Sub_metering3"))
dev.off()


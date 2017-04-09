# Read in the data
classDef = c(c(NA,NA),rep("character",7))
hpc = read.csv("household_power_consumption.txt",sep = ';',colClasses = classDef)
hpcfile = subset(hpc, subset = (Date == "1/2/2007" | Date == "2/2/2007"))
hpcfile$Global_active_power = as.numeric(hpcfile$Global_active_power)

# Plot the data in the file
png(filename = "plot2.bmp",width = 480, height = 480)
row.names(hpcfile) = 1:2880
plot(1:2880,hpcfile$Global_active_power,type = 'l',
     ylab =  'Global Active Power (kilowatts)',xlab  = '',xaxt = "n")
axis(side = 1,at = c(0,1441,2880),labels = c("Thu","Fri","Sat"))
dev.off()


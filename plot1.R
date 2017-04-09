# Read in the data
classDef = c(c(NA,NA),rep("character",7))
hpc = read.csv("household_power_consumption.txt",sep = ';',colClasses = classDef)
hpcfile = subset(hpc, subset = (Date == "1/2/2007" | Date == "2/2/2007"))
hpcfile$Global_active_power = as.numeric(hpcfile$Global_active_power)

# Plot the data in the file
png(filename = "plot1.bmp",width = 480, height = 480)
hist(hpcfile$Global_active_power,xlab = 'Global Active Power (kilowatts)', 
     ylab = 'Frequency',col = 'red',main = 'Global Active Power',ylim = c(0,1200))
dev.off()
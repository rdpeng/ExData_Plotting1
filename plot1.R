# Read the data into R
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";") 

# Strip down to only the data on 1/2/2007 and 2/2/2007
data <- data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

# Save the plot produced
png(filename="plot1.png",width=480,height=480,units="px")

# Create histogram of the data with 12 bins and add in the relevant labels.
hist(as.numeric(as.character(data$Global_active_power)),
     breaks=12,xlim=c(0,6),ylim=c(0,1200),freq=TRUE,
     main="Global Active Power", axes=FALSE, xlab="Global Active Power (kilowatts)",
     col="red", xaxt='n')

# Create the correct axes labels
axis(side=1, at=seq(0,6,2), labels=seq(0,6,2))
axis(side=2, at=seq(0,1200,200), labels=seq(0,1200,200))

dev.off()
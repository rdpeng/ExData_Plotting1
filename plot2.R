# Read the data into R
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";") 

# Strip down to only the data on 1/2/2007 and 2/2/2007
data <- data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

# extract the dates and times and put them into plottable format
x <- as.POSIXct(strptime(paste(data$Date,data$Time,sep=" "), format="%d/%m/%Y %H:%M:%S"))

# extract y axis numbers
y <- as.numeric(as.character(data$Global_active_power))

# save the plot
png(filename="plot2.png",width=480,height=480,units="px")

# create line plot
plot(x,y,type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()
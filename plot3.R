#########################
## Project 1
## Plot1 Multiple line graph of Sub Metering data 
############################

print("Reading file")
dt <- read.csv("household_power_consumption.txt", sep = ";")


# create start dates to subset data frame with
start_date <- as.Date("01/02/2007", "%d/%m/%Y")
end_date <- as.Date("02/02/2007", "%d/%m/%Y")

# Get the subset of data for the two dates used. 
print("Subsetting data frame")
xt <- dt[as.Date(dt$Date, "%d/%m/%Y") >= start_date & as.Date(dt$Date, "%d/%m/%Y") <= end_date,]

# convert Global_active_power to a numeric
Xt <- transform(xt, Sub_metering_1 = as.numeric(as.character(Sub_metering_1)),
                Sub_metering_2 = as.numeric(as.character(Sub_metering_2)),
                Sub_metering_3 = as.numeric(as.character(Sub_metering_3)))

# Create the plot
print("Creating Line Graph")
par(mfrow = c(1, 1))  # set the frame to a single graph

xdata <- strptime(paste(Xt$Date,Xt$Time),"%d/%m/%Y %H:%M:%S") # data for x axis

plot(range(xdata), range(Xt$Sub_metering_1), type="n", ylab="Energy sub metering", xlab="")

lines(xdata,Xt$Sub_metering_1, col = "black")

lines(xdata,Xt$Sub_metering_2, col = "red")

lines(xdata,Xt$Sub_metering_3, col = "blue")

legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), 
       col = c("black","red", "blue"), cex=1, xjust=1)


# Copy to png file
dev.copy(png,file="plot3.png")
dev.off() 



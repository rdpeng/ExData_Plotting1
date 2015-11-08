#########################
## Project 1
## Plot2 Line graph of Global Active Power 
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
Xt <- transform(xt, Global_active_power = as.numeric(as.character(Global_active_power)))

# Make line graph
print("Creating Line Graph")
par(mfrow = c(1, 1))  # set the frame to a single graph
xdata <- strptime(paste(Xt$Date,Xt$Time),"%d/%m/%Y %H:%M:%S") # data for X axis
with(Xt, plot(xdata, Xt$Global_active_power, type="l", ylab="Global Active Power (Kilowatts)", xlab=""))

# Copy to png file
dev.copy(png,file="plot2.png")
dev.off() 



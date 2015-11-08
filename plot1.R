#########################
## Project 1
## Plot1 Histogram of Global Active Power 
############################

print("Reading file")
dt <- read.csv("../household_power_consumption.txt", sep = ";")


# create start dates to subset data frame with
start_date <- as.Date("01/02/2007", "%d/%m/%Y")
end_date <- as.Date("02/02/2007", "%d/%m/%Y")

# Get the subset of data for the two dates used. 
print("Subsetting data frame")
xt <- dt[as.Date(dt$Date, "%d/%m/%Y") >= start_date & as.Date(dt$Date, "%d/%m/%Y") <= end_date,]

# convert Global_active_power to a numeric
Xt <- transform(xt, Global_active_power = as.numeric(as.character(Global_active_power)))

# Make historgram graph
print("Creating Histogram")
par(mfrow = c(1, 1))  # set the frame to a single graph
hist(Xt$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

# Copy to png file
dev.copy(png,file="plot1.png")
dev.off() 



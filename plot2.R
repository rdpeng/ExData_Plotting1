#### set working directory ###

setwd("C:\\Temp\\Coursera\\Exploratory Data Analysis\\Data")

### Read in household power consumption text file ###
# ';' is the delimiter
# '?' is the NULL character
# Date and Time columns will be converted to single date/time stamp column

data <- read.csv("household_power_consumption.txt", sep=";",
                 colClasses=c(rep("character",1),
                              rep("character",2)),
                 na.strings="?")

### Create datetime column from the Date and Time columns ###
data$DateTime <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")

### Subset data to read from the dates 2007-02-01 and 2007-02-02 ###

data_subset = subset(data,
                     as.Date(data$DateTime) >= "2007-02-01" & 
                       as.Date(data$DateTime) <= "2007-02-02")

# Convert columns to numeric
for(i in c(3:9)) {data_subset[,i] <- as.numeric(as.character(data_subset[,i]))}

### Plot 2 ###
# Start PNG device, 480 x 480 pixels

png(filename="plot2.png", height=480, width=480, units = "px", bg="transparent")

# Plot the line
plot(data_subset$DateTime,
     data_subset$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

# Close device and save file
dev.off()

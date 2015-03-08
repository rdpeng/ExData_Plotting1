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


### Plot 1 ###
# Start PNG device, 480 x 480 pixels

png(filename="plot1.png", height=480, width=480, units = "px", bg="transparent")

# Build histogram
hist(data_subset$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)",ylab="Frequency")

# Close device and save file
dev.off()

### Plot 2 ###



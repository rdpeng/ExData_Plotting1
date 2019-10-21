library(readr)
library(dplyr)
library(lubridate)
power <- read.csv("./data/household_power_consumption.txt", header = TRUE, sep = ";")
# Read file of 2075259 obs and of 9 variables

power$Date <- dmy(power$Date) # changing the format of Date columns

power <- power %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02") # subsetting power to the required dates
# new file of 2880 obs and of 9 variables

power$Global_active_power <- as.numeric(as.character(power$Global_active_power)) # converting factors into numeric # making the factors to numeric. first make into charcters, then numeric
powerc <- power[complete.cases(power),] # getting the complete cases with NAs
png("plot1.png", height = 480, width = 480) # setting the output
hist(powerc$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red" ) # making the histogram
dev.off() # closing the file


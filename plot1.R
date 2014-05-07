## Author: Christopher Wilson
## email: wilsoncj1@gmail.com
## date: 5/6/2014

###################################################
# Boilerplate code for reading UCI file for project 1.  Code assumes
# the household_power_consumption.txt is in the local 'data/'
# directory and is uncompressed.  
# 
# This code will rbind only those lines from Feb 1st and 2nd, 2007.  It 
# will then create a new column called 'DateTime' as a POSIXct class from 
# the 'Date' and 'Time' fields.  Due to some 'rbind' nuances with data.frame
# and data.table we then transform the numeric fields to the appropriate class
# and re-order the columns so that 'DateTime' is the first column.
# 
# If you wish to download the source .zip file uncomment lines
# 26 through 31.
####################################################

library('lubridate')
library('plyr')
library('data.table')

## Last source file download time: 5/6/2014 23:10:00 EST

# if (!file.exists('data') {
#   dir.create('data')
# }
# url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# download.file(url,
#               destfile='data/household_power_consumption.zip', method='curl')

dataFile = 'data/household_power_consumption.txt'

df <- data.table(character(0), character(0), numeric(0), numeric(0), numeric(0),
                 numeric(0), numeric(0), numeric(0), numeric(0))

con <- file(dataFile, open = "r")

header <- readLines(con, n = 1, warn = FALSE)
header <- strsplit(header, ";")
setnames(df, unlist(header))

# file Date in format dd/mm/yyyy 
# course date YYYY-MM-DD 2007-02-01 and 2007-02-02 - Feb 1-2, 2007

while (length(line <- readLines(con, n = 1, warn = FALSE)) > 0) {
  line <- strsplit(line, ";")
  line <- unlist(line)
  
  if (line[1] == "1/2/2007" | line[1] == "2/2/2007") {
    df <- rbind(df, t(line))
  }
}

close(con)

df <- ddply(df, .(Date, Time), mutate,
            DateTime = as.POSIXct(strftime(paste(dmy(Date), Time, sep=" "), 
                                           "%Y-%m-%d %H:%M:%S")))

df <- df[c("DateTime", "Date", "Time", "Global_active_power", 
           "Global_reactive_power",
           "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
           "Sub_metering_3",
           "DateTime")]

df$Date <- as.character(df$Date)
df$Time <- as.character(df$Time)
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Voltage <- as.numeric(as.character(df$Voltage))
df$Global_intensity <- as.numeric(as.character(df$Global_intensity))
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

# Create a base plot histogram in red of Global_active_power from the df
# data table.

# Create png device to write histogram to

png(file = "plot1.png", bg="white",
    width=480, height=480)

# Create the histogram

with(df, hist(Global_active_power, col="red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power"))

# Turn off the png device
dev.off()

# Write the histogram to the R console and wait for the user 
# to close the R session

with(df, hist(Global_active_power, col="red",
              xlab = "Global Active Power (kilowatts)",
              main = "Global Active Power"))

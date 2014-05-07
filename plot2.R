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

dataFile = 'data/household_power_consumption.txt'

df <- data.table(character(0), character(0), numeric(0), numeric(0), numeric(0),
                 numeric(0), numeric(0), numeric(0), numeric(0))

# open a connection to the data file
con <- file(dataFile, open = "r")

# read the first line as a header
header <- readLines(con, n = 1, warn = FALSE)
header <- strsplit(header, ";")

# set the column names
setnames(df, unlist(header))

# file Date in format dd/mm/yyyy 
# course date YYYY-MM-DD 2007-02-01 and 2007-02-02 - Feb 1-2, 2007

# read each line
while (length(line <- readLines(con, n = 1, warn = FALSE)) > 0) {
  # split the line on ";"
  line <- strsplit(line, ";")
  line <- unlist(line)
  # if the line is equal to either date rbind to the data table
  if (line[1] == "1/2/2007" | line[1] == "2/2/2007") {
    df <- rbind(df, t(line))
  }
}

# close the connection
close(con)

# create a new DateTime column out of date and time char fields
df <- ddply(df, .(Date, Time), mutate,
            DateTime = as.POSIXct(strftime(paste(dmy(Date), Time, sep=" "), 
                                           "%Y-%m-%d %H:%M:%S")))

# Re-order the columns so DateTime is first.  Just being tidy.
df <- df[c("DateTime", "Date", "Time", "Global_active_power", 
           "Global_reactive_power",
           "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
           "Sub_metering_3")]

# Changing the class of each column.  Some nuances with data.table and
# data.frame change the columns to factors.
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

# Create png device to write plot to.  White background, 
# 480 x 480 in size.

png(file = "plot2.png", bg="white",
    width=480, height=480)

# Create the plot propriate colors and labels.

with(df, plot(DateTime, Global_active_power, type="l",
              xlab = "",
              ylab = "Global Active Power (kilowatts)", 
              lwd=1))

# Turn off the png device
dev.off()

# Write the plot to the R console and wait for the user 
# to close the R session

with(df, plot(DateTime, Global_active_power, type="l",
              ylab = "Global Active Power (kilowatts)", 
              lwd=1))



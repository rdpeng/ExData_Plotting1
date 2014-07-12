# plot2.R - Code to generate plot2.png
# Coursera Exploratory Data Analysis
# Project 1

inFile <- './data/household_power_consumption.txt'

# Read in data
#   Use grep to filter the input file to only the dates we need:
#   1/2/2007
#   2/2/2007
dat <- read.table(pipe(sprintf('grep "^[12]/2/2007;" %s', inFile)), 
                  header=FALSE, 
                  sep=";")

# Assign the column names from the header of the input file.
colnames(dat) <- names(read.table(inFile, header=TRUE, sep=";", nrows=1))

# Add new column with the class "POSIXlt" made from the Date and Time columns
dat$datetime <- strptime(paste(dat$Date, dat$Time), format="%d/%m/%Y %T")


# Open the png graphics device
png(filename='plot2.png', 
    width=480, height=480,
    units='px',
    bg='transparent')

# Issue the plot command(s)
plot(dat$datetime, dat$Global_active_power,
     type='l',                                 # Line plot
     main='', 
     xlab='', 
     ylab='Global Active Power (kiloWatts)')

# Close the graphics device, causing the PNG file to be written
dev.off()

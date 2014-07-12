# plot1.R - Code to generate plot1.png
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

# Open the png graphics device
png(filename='plot1.png', 
    width=480, height=480,
    units='px',
    bg='transparent')

# Issue the plot command(s)
hist(dat$Global_active_power, 
     main="Global Active Power", 
     xlab='Global Active Power (kiloWatts)', 
     ylab='Frequency', 
     col='red')

# Close the graphics device, causing the PNG file to be written
dev.off()

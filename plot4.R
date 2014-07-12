# plot4.R - Code to generate plot4.png
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
png(filename='plot4.png', 
    width=480, height=480,
    units='px',
    bg='transparent')

# Set up for a 2x2 array of plots
par(mfrow=c(2,2))

# Issue the plot command(s)
# Subplot for top-left, position (1,1)
plot(dat$datetime, dat$Global_active_power,
     type='l',                                 # Line plot
     main='', 
     xlab='', 
     ylab='Global Active Power')

# Subplot for top-right, position (1,2)
plot(dat$datetime, dat$Voltage,
     type='l',                                 # Line plot
     main='', 
     xlab='datetime', 
     ylab='Voltage')

## Subplot for bottom-left, position (2,1)
plot(dat$datetime, dat$Sub_metering_1,
     type='l',                                 # Line plot
     col='black',                              # block line
     main='',                                  # no title
     xlab='',                                  # no x-axis label
     ylab='Energy sub metering')               # y-axis label

# Add line for sub metering 2
lines(dat$datetime, dat$Sub_metering_2,
     col='red')                                 # Red line

# Add line for sub metering 3
lines(dat$datetime, dat$Sub_metering_3,
      col='blue')                               # Blue line

# Add legend
legend("topright",                              # legend box position
       lwd=1,                                   # line width of legend lines
       bty='n',                                 # no box around legend
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       col=c('black','red','blue'))             # legend colors

## Subplot for bottom-right position(2,2)
plot(dat$datetime, dat$Global_reactive_power,
     type='l',                                 # Line plot
     main='',                                  # No title
     xlab='datetime')                          # x-axis label

# Close the graphics device, causing the PNG file to be written
dev.off()

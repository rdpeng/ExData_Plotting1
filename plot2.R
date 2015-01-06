#################################################################################
## Course: Exploratory Data Analysis                                           ##
## Project 1                                                                   ##
## Script: plot2.R                                                             ##
#################################################################################

#######################################
##  Step1: Read the data to R        ##
#######################################

cFileName <- "household_power_consumption.txt"
## only need the first 3 cols (Date, Time, Global active power)
cols <- c("character", "character", "numeric", rep("NULL", 6)) 

## Only need the date from 1/2/2007 0:00 to 2/7/2007 23:59
dfGlobalActivePower <- read.table(cFileName,sep=";", skip=66637, nrows=(2*24*60), 
                                  na.strings="?", colClasses=cols)
vHeader <- read.table(cFileName, header=TRUE, na.strings="?", nrows=1, 
                      sep=";", check.names=TRUE, colClasses=cols)						  
names(dfGlobalActivePower) <- names(vHeader)

#######################################
##  Step2: Plotting                  ##
#######################################

vDateTime <- paste(dfGlobalActivePower$Date, dfGlobalActivePower$Time, sep=" ")
tDateTime <- strptime(vDateTime, format="%d/%m/%Y %H:%M:%S")

Sys.setlocale("LC_TIME", "C")
png(filename = "plot2.png", width = 480, height = 480, units = "px",
    pointsize = 11.75, bg = "transparent")
plot(tDateTime, format="%a", dfGlobalActivePower$Global_active_power,
     type="l", main="", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

############################################
## End of script plot2.R -- Chih-Hao Lai  ##
############################################

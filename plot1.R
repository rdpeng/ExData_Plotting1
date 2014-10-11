# plot1() function:  creates Exporatory Data Analysis Project 1 plot1.png file

# Prior to running this or the other plotx() functions, download Zipped project data file from
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# into working directory. UnZip the file, which will create a .txt file in a subdirectory
# immediately below the working directory.

#Usage: 
# plot1()         -- generates plot1 in plot1.png file in working directory
#                 Starts from unZipped (.txt) project data file assumed to be in 
#                 subdirectory "exdata_data_household_power_consumption" of working directory
# dfx <- plot1()   -- same as above, but returns dataframe named "dfx" which can be used in subsequent 
#                 runs of the plotx() functions to save the initial read.table and subsetting step.
# plot1(dfx)       -- if a plotx() function has been run with results assigned to dfx, the current
#                 run will pick use that previously created data frame and run faster


plot1 <- function(dfx) {

if (missing(dfx) || !is.data.frame(dfx)) {
  fname = "exdata_data_household_power_consumption//household_power_consumption.txt"
  df = read.table(file=fname, header=T, sep=";", na.strings="?", nrows = 0, 
                  colClasses=c(rep("character",2), rep("numeric",7)))

# Subset the data to keep just two days of interest for this analysis,
# and add POSIXlt date variable created from two original Date and Time character variables.
  
dfx = df[df$Date %in% c("1/2/2007","2/2/2007"),]
dfx$DateTime <- strptime(paste(dfx[,1], dfx[,2]), format="%d/%m/%Y %T")
}

# Do the plot to plot1.png file and close the graphics device

if (file.exists("plot1.png")) file.remove("plot1.png")
png(filename="plot1.png")
with(dfx, hist(Global_active_power, col="red", main="Global Active Power", 
               xlab="Global Active Power (kilowatts)"))
dev.off()

#Cause data frame dfx to be returned, but doesn't try to print it if no
#assignment of the return to an object is specified

dfx = dfx
}
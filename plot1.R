# plot1() function:  creates Exporatory Data Analysis Project 1 plot1.png file


#Usage: 
# plot1()         -- generates plot1 in plot1.png file in working directory. 
#                   First downloads project data file from:
#                   https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#                   Then unzips .txt file to temp file and does read.table to produce big data frame "df."
#                   Next subsets df to produce small data frame "dfx", and generates plot.
# dfx <- plot1()   -- same as above, but returns dataframe named "dfx" which can be used in subsequent 
#                  runs of the plotx() functions to save the initial download, read.table and subsetting steps.
# plot1(dfx)       -- if any plotx() function has been run with results assigned to dfx, the current
#                  run will use that previously created data frame and run 100x faster


plot1 <- function(dfx) {
  

if (missing(dfx) || !is.data.frame(dfx)) {
  
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
  df <- read.table(unz(temp, "household_power_consumption.txt"),header=T, sep=";", na.strings="?", 
                   nrows = 0, colClasses=c(rep("character",2), rep("numeric",7)) )
  unlink(temp)
  
# Subset the data to keep just two days of interest for this analysis,
# and add POSIXlt date variable created from two original Date and Time character variables.
  
dfx = df[df$Date %in% c("1/2/2007","2/2/2007"),]

rm(df)

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
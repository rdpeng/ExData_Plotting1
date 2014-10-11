# plot2() function:  creates Exporatory Data Analysis Project 1 plot2.png file

#Usage: 
# plot2()         -- generates plot1 in plot1.png file in working directory. 
#                   First downloads project data file from:
#                   https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#                   Then unzips .txt file to temp file and does read.table to produce big data frame "df."
#                   Next subsets df to produce small data frame "dfx", and generates plot.
# dfx <- plot2()   -- same as above, but returns dataframe named "dfx" which can be used in subsequent 
#                  runs of the plotx() functions to save the initial download, read.table and subsetting steps.
# plot2(dfx)       -- if any plotx() function has been run with results assigned to dfx, the current
#                  run will use that previously created data frame and run 100x faster




plot2 <- function(dfx) {
  
  if (missing(dfx) || !is.data.frame(dfx)) {

    temp <- tempfile()
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
    df <- read.table(unz(temp, "household_power_consumption.txt"),header=T, sep=";", na.strings="?", 
                     nrows = 0, colClasses=c(rep("character",2), rep("numeric",7)) )
    unlink(temp)

 
# Subset the big data frame to keep just the 2 days of interest, and
# create new DateTime column of class "POSIXlt" from original Date and Time character cols


  dfx = df[df$Date %in% c("1/2/2007","2/2/2007"),]

  rm(df)

  dfx$DateTime <- strptime(paste(dfx[,1], dfx[,2]), format="%d/%m/%Y %T")

  }

# generate the plot in "plot2.png" in the workiing directory.
# Eliminate x-axis label and specify line-only plot (no points)

if (file.exists("plot2.png")) file.remove("plot2.png")
  png(filename="plot2.png")
  with(dfx, plot(DateTime, Global_active_power, type="l", xlab="",
                 ylab="Global Active Power (kilowatts)"))
  dev.off()

#Cause data frame dfx to be returned, but doesn't try to print it if no
#assignment of the return to an object is specified

dfx = dfx
  
}
# plot4() function:  creates Exporatory Data Analysis Project 1 plot4.png file

# Prior to running this or the other plotx() functions, download Zipped project data file from
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# into working directory. UnZip the file, which will create a .txt file in a subdirectory
# immediately below the working directory.

#Usage: 
# plot4()                   -- generates plot4 in plot4.png file in working
#                           directory. Starts from unZipped (.txt) project data file assumed 
#                           to be in subdirectory "exdata_data_household_power_consumption" 
#                           of working directory
# dfx <- plot4()            -- same as  above, but returns dataframe named "dfx" which can be
#                           used in subsequent runs of the plotx() functions to save the 
#                           initial read.table and subsetting steps. 
# plot4(dfx)                 -- if a plotx() function has been run with results assigned to dfx, 
#                           the current run will use that previously created data frame and run faster 

plot4 <- function(df) {
  
  if (missing(df) || !is.data.frame(df)) {
    fname = "exdata_data_household_power_consumption//household_power_consumption.txt"
    df = read.table(file=fname, header=T, sep=";", na.strings="?", nrows = 0, 
                    colClasses=c(rep("character",2), rep("numeric",7)))
    
    
    # Subset the big data frame to keep just the 2 days of interest, and
    # create new DateTime column of class "POSIXlt" from original Date and Time character cols
    
    
    dfx = df[df$Date %in% c("1/2/2007","2/2/2007"),]
    dfx$DateTime <- strptime(paste(dfx[,1], dfx[,2]), format="%d/%m/%Y %T")
    
  }
  
  # generate the plot in "plot4.png" in the working directory.
  # Eliminate x-axis label and specify line-only plot (no points)
  
  if (file.exists("plot4.png")) file.remove("plot4.png")
  # Put colors in a vector to avoid mix-up between color asssignments for lines and legend
  colors = c("gray30","red","dodgerblue3")
  png(filename="plot4.png")
  
  par(mfrow=c(2,2))
  
  with(dfx, {
    plot(DateTime, Global_active_power, type="l", col=colors[1], xlab="",
                 ylab="Global Active Power")

    plot(DateTime, Voltage, type="l", col='black', xlab="datetime",)
    
    plot(DateTime, Sub_metering_1, type="l", col=colors[1], xlab="",
                 ylab="Energy sub metering")
      lines(DateTime, Sub_metering_2, type="l", col=colors[2])
      lines(DateTime, Sub_metering_3, type="l", col=colors[3])
      legend("topright", col=colors, lty=1, legend=names(dfx)[7:9], bty="n") 
    
   
    plot(DateTime, Global_reactive_power, type="l", col='black', xlab="datetime")
    
  })
  
  dev.off()
  
  #Cause data frame dfx to be returned, but doesn't try to print it if no
  #assignment of the return to an object is specified
  
  dfx = dfx
  
}
# this function will read and format the date for the plot function to use
readData <- function()
{
    # NOTE: Change this value to match your file location
    setwd("C:/dev/r/data/")    
    fileName <- "household_power_consumption.txt"
    
    if (!file.exists(fileName)) 
    {
        print("File does not exist!")
        allData <- NULL
    } 
    else
    {
        print( paste("Loading plot data from...",getwd()) )
        
        #column names
        colNames = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3" )
        colClasses = c("character", "character", rep("numeric",7) )
        
        #read file
        allData <- read.table(fileName, header = TRUE, sep = ";", col.names = colNames, colClasses = colClasses, na.strings = "?")
        
        #convert to Date type, then filter
        allData$Date = as.Date(allData$Date, format = "%d/%m/%Y")
        allData = allData[allData$Date >= as.Date("2007-02-01") & allData$Date <= as.Date("2007-02-02"),]
    }    
    
    # return data
    invisible(allData)
}


# this function will save a file plot4.png as requested by assignment
plot4 <- function()
{
    allData <- readData()
    
    # Draw and save plot
    png(filename = "plot4.png", width = 480, height = 480, units = "px")

    # 4 plots
    par(mfrow = c(2,2))
    
    # upper left plot
    plot( strptime( paste( allData$Date, allData$Time), "%Y-%m-%d %H:%M:%S"), allData$Global_active_power, type = 'l', xlab = "", ylab = 'Global Active Power')
    
    # upper right plot
    plot( strptime( paste( allData$Date, allData$Time), "%Y-%m-%d %H:%M:%S"), allData$Voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage' )
    
    # lower left plot
    plot( strptime( paste( allData$Date, allData$Time), "%Y-%m-%d %H:%M:%S"), allData$Sub_metering_1, type = 'l', xlab = "", ylab = 'Energy sub metering')
    lines( strptime( paste( allData$Date, allData$Time), "%Y-%m-%d %H:%M:%S"), allData$Sub_metering_2, col = 'red')
    lines( strptime( paste( allData$Date, allData$Time), "%Y-%m-%d %H:%M:%S"), allData$Sub_metering_3, col = 'blue')
    legend("topright",legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col = c('black','red','blue'), bty = 'n', lwd = 1 )
    
    # lower right plot
    plot( strptime( paste( allData$Date, allData$Time), "%Y-%m-%d %H:%M:%S"), allData$Global_reactive_power, type = 'l', xlab = 'datetime', , ylab="Global_reactive_power")
    
    dev.off()    
    invisible(NULL)
}

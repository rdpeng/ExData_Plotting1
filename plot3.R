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
        colNames = c("Date","Time","Global_active_power",";Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3" )
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


# this function will save a file plot3.png as requested by assignment
plot3 <- function()
{
    allData <- readData()
    
    # Draw and save plot
    png(filename = "plot3.png", width = 480, height = 480, units = "px")
    plot( strptime( paste( allData$Date, allData$Time), "%Y-%m-%d %H:%M:%S"), allData$Sub_metering_1,type = 'l',xlab = "", ylab = 'Energy sub metering')
    with( allData, lines( strptime( paste( Date, Time), "%Y-%m-%d %H:%M:%S"), Sub_metering_2, col = 'red'))
    with( allData, lines( strptime( paste( Date, Time), "%Y-%m-%d %H:%M:%S"), Sub_metering_3, col = 'blue'))
    legend( "topright", legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col = c('black','red','blue'),lwd = 1)
    dev.off()
    
    invisible(NULL)
}

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


# this function will save a file plot1.png as requested by assignment
plot1 <- function()
{
    allData <- readData()
    
    if ( is.null(allData) )
    {
        print("ERROR: No data was loaded")
    }
    else
    {
        #plot and save graph
        png(filename = "plot1.png", width = 480, height = 480, units = "px")
        hist(allData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
        dev.off()
    }
    
    invisible(NULL)
}


## Set the working Directory. The directory where the data is saved

    setwd("C:/Users/jobby/Documents/Personal/Data Science/Exploratory Data Analysis")
    
## Read the downloaded data from the directory

    powerData<- read.csv("household_power_consumption.txt", header=T, sep=";", na.strings = "?")

## Format the Date data

    powerData$Date<- as.Date(powerData$Date, format = "%d/%m/%Y")

## Subset the data to select information for the needed dates only
    
    newDat<- subset(powerData, subset = (Date == "2007-02-01" | Date == "2007-02-02"))
    
    rm(powerData)
    
## Combine the Date and Time fields
    
    DateTime<- paste(as.Date(newDat$Date), newDat$Time)
    newDat$DateTime <- as.POSIXct(DateTime)
    
## Create Histogram

    hist(newDat$Global_active_power, main = "Global Active Power", xlab="Global Active Power", ylab="Frequency", col = "Red")
    
## Create copy of the histogram in a png file

    dev.copy(png, file = "plot1.png", height = 480, width = 480)

    dev.off()

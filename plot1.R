## to use this file: 
## download the file by running data <- initfile()
## extract the data from 2007-02-01 to 2007-02-02 with dataset <- extractdata(data)
## draw the plot with drawplot1(dataset)

##initfile downloads the file from the internet, extracts the zip file and returns the data in a dataframe
initfile <- function(){
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "temp", method = "curl")
        unzip("temp", "household_power_consumption.txt")
        data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
        data
        }

##extractdata subsets the data and keeps only data from 2007-02-01 and 2007-02-02. 
extractdata <- function(data){
        data$Date<-as.Date(data$Date, "%d/%m/%Y")
        dataset <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02") ,]
        dataset
}

drawplot1 <- function(dataset){
        png(filename = "plot1.png", width = 480, height = 480)
        with(dataset, hist(Global_active_power, xlim = c(0,6), col = 2, xlab = "Global Active Power (kilowatts)", ylim = c(0, 1200), main = "Global Active Power"))
        dev.off()
        
}



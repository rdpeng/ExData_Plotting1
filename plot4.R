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


drawplot4 <- function(dataset){
        dataset$DateTime <- strptime(paste(dataset$Date, dataset$Time), format = "%Y-%m-%d %T")
        png(filename = "plot4.png", width = 480, height = 480)
        par(mfrow = c(2,2))
        with(dataset, plot(DateTime, Global_active_power, ylab = "Global Active Power", xlab = "", ylim = c(0, 8),type = "l"))
        with(dataset, plot(DateTime, Voltage, ylab = "Voltage", xlab = "datetime",type = "l"))
        with(dataset, plot(DateTime, Sub_metering_1,type = "l", ylab = "Energy sub metering", xlab = ""))
        with(dataset, points(DateTime, Sub_metering_2,col = "red", type = "l"))
        with(dataset, points(DateTime, Sub_metering_3,col = "blue", type = "l"))
        legend("topright", lty = 1, col = c("black", "blue", "red"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        with(dataset, plot(DateTime, Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime",type = "l"))
        
        dev.off()
}



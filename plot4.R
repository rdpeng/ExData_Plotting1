plot4 <- function() {
        ##Checks if data exists in working directory, if not it will download it and download it in a tempfile
        fileName <- "household_power_consumption.txt"
        if (!file.exists("household_power_consumption.txt")){
                tempfile <- tempfile()
                URL <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
                download.file(URL,tempfile)
                data <- read.table(unz(tempfile, fileName), sep=";",
                                   skip=0, nrows=100000, header=TRUE, na.strings="?")
                unlink(tempfile)
        } else{
                ##reads part of the data which includes the relevant data
                data <- read.table(fileName, sep=";", skip=0, nrows=100000, header=TRUE, na.strings="?")
        }
        
        ##creates a subst data table for the relevant dates
        data<-subset(data, Date == "1/2/2007" | Date == "2/2/2007")
        ##removes the NAs in the data
        data<-data[complete.cases(data),]
        
       ##convert the Time column to POSIXlt standard date-times.
        data$DateTime<-strptime(paste(data[["Date"]], data[["Time"]]),"%d/%m/%Y %H:%M:%S")
        
        ##formatting the page for plots
        par(mfrow = c(2, 2), mar = c(4, 4, 2, 2), oma = c(1, 1, 1, 1))
       
       ##Plot 1st of 4 plots. Plot of Global Active Power
       plot(data[["DateTime"]], data[["Global_active_power"]], 
            type="l",
            xlab="",
            ylab="Global Active Power")
       
       ##Plot 2nd of 4 plots. Plot of Voltage
       plot(data[["DateTime"]], data[["Voltage"]], 
            type="l",
            xlab="datetime",
            ylab="Voltage")
       
       ##Plot 3rd of 4 plots. Plot of Energy Sub meeting with legend
       plot(data[["DateTime"]], data[["Sub_metering_1"]],
            type="l",
            ylab="Energy sub metering",
            xlab="",
            col="black")
       lines(data[["DateTime"]], data[["Sub_metering_2"]],
             col="red",
             type="l")
       lines(data[["DateTime"]], data[["Sub_metering_3"]],
             col="blue",
             type="l")
       legend("topright", cex=0.7, bty="n", lty= 1, col = c("black", "red", "blue"), 
              legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
       
       ##Plot 4th of 4 plots. Plot of Global_Reactive_power
       plot(data[["DateTime"]], data[["Global_reactive_power"]], 
            type="l",
            xlab="datetime",
            ylab="Global_reactive_power") 
}

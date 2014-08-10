plot1 <- function() {
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

        ##formatting the graph page
        par(mfrow = c(1, 1), mar = c(4, 4, 2, 2), oma = c(1, 1, 1, 1))

        ## Create histogram with 11 breaks, color red, and add head title and x-axis title
        hist(data[["Global_active_power"]],breaks=11, 
             col="red", 
             xlab="Global Active Power (kilowatts)",
             main="Global Active Power")
}

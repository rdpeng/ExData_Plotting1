## Prepare the data to make it avaialble for plotting.
##
## It first check the current working directory for the file. If file not 
## present then it try to download if download data is also not present. Then
## unzip the downloaded file. In last, load the file to data frame.



prepareData <- function() {
    
    zipFile <- "exdata_data_household_power_consumption.zip"
    dataFile <- "household_power_consumption.txt"
    # Check whether "household_power_consumption.txt" file exists or not.
    if(!file.exists(dataFile)) {
        
        # Check whether raw file (zip format) is exists or not.
        # If not exists then download.
        if(!file.exists(zipFile)) {
            fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
            download.file(fileUrl,destfile=zipFile, method="curl", quiet=TRUE)
        }
        
        # now unzip the file
        unzip(zipFile)
    }
    
    # read the data
    data <- read.table(file=dataFile, header=TRUE, sep=";", na.strings="?", 
                       colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
    
    # Subset the data
    data <- data[as.Date(data$Date, format="%d/%m/%Y") == "2007-02-01" | as.Date(data$Date, format="%d/%m/%Y") == "2007-02-02", ]
    data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    data
}



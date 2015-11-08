library(downloader)

date_time <- function(date, time) {
        return (strptime(paste(date, time), "%d/%m/%Y %H:%M:%S"))
}

load_data <- function() {

############
        
# Commenting below lines with an assumption that the required file is already downloaded in the required directory, unzipped and ready to be used.
        
#        if (!file.exists("./data")){
#        dir.create("./data") # Create directory to store the downloaded Zip File
#        }

# fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"


# download(fileurl, destfile ="./data/powerdata.zip",mode="wb") # Use download function from downloader package to download the file
# unzip("./data/powerdata.zip", exdir = "./data/PowerData") # Unzip the file


#############

powerdata <- read.table("./data/PowerData/household_power_consumption.txt", header = TRUE, sep = ";", na="?") # Read the information of power data in R

powerdata$Time <- strptime(paste(powerdata$Date, powerdata$Time), "%d/%m/%Y %H:%M:%S") # Convert in time format as per assignment instructions
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y") # Convert in date format as per assignment instructions


df <- powerdata[(powerdata$Date =="2007-02-01") | (powerdata$Date=="2007-02-02"),] #Restrict to data of 01st and 02nd Feb for assignment Purpose.

return(df)
}
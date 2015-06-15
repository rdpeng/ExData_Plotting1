library(lubridate)
library(sqldf)

readFebData <- function(){
#================================================
#This function returns data required for plotting
#================================================ 
  #download data from URL
  print ("file is going to be downloaded")
  dataFileURL <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  #https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
  #I am using Windows so https is removed and replaced with http curl does not work in my machine
  if (!file.exists(".\\data")){dir.create(".\\data")}#if there is no directory called data create one
  #now store downloaded file in data directory
  download.file(dataFileURL, destfile = ".\\data\\data.zip", mode ="wb")#mode set to "wb" because this is binary data
  unzip (".\\data\\data.zip")
  
    
  #if we come here that means the folder exists that means unzip has worked :)
    
  #read the full data set -- commented out as I found how to read only selected data set
  #data <- read.table(".\\household_power_consumption.txt", header = TRUE, sep =";", 
                               # stringsAsFactors=FALSE, )
								
  ### READING data selectively
  sqlquery <- "select * from file where Date in ('1/2/2007','2/2/2007')"
  feb_data <- read.csv.sql(".\\household_power_consumption.txt", sep = ";", sql = sqlquery, header = TRUE) 
  closeAllConnections()
    
  feb_data$Date <- gsub("/", "-", feb_data$Date)#reformat Date to have - instead of /
  
  #create a new column DateTime - but this requires the lubridate library
  DateTime <- dmy_hms(paste( feb_data$Date, feb_data$Time))
  #add this to the data frame
  newsub = cbind(DateTime, feb_data)
  newsub  
 }
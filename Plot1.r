#Set working directory, if needed
 #setwd("C:\\Scratch\\_coursera\\Class4")

#Install package and download data. Uncomment to execute
 # install.packages("downloader")
 # require(downloader)
 # url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
 # download(url, "HHPC.zip")
 # unzip("HHPC.zip")

#Import Data Set
  #Select only data from 2007-02-01 and 2007-02-02
  HHPC <- read.table(".\\household_power_consumption.txt", header = FALSE, sep = ";", skip=66637, nrows=2880)   
  #Build Column Name vector
  colnames(HHPC) <- c("Date"
	,"Time"
	,"Global_active_power"
	,"Global_reactive_power"
	,"Voltage"
	,"Global_intensity"
	,"Sub_metering_1"
	,"Sub_metering_2"
	,"Sub_metering_3")
  #Transform columns to correct format
  HHPC<-transform(HHPC, Date = as.Date(Date,"%d/%m/%Y"))
  HHPC<-transform(HHPC, Global_active_power = as.numeric(Global_active_power))
  
#Make Plot 1
  #Set Output Device
  png("plot1.png", width = 480, height = 480)
  #Make Histogram
  hist(HHPC$Global_active_power, breaks=12, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power", cex.axis=.75, cex.lab=.75, cex.main=.75)
  #Close file
  dev.off()
  

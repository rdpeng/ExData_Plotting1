library(data.table)

##Download and unzip the dataset (if it exists not already in the working directory)
filename <- "Electric Power Consumption.zip"
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, filename, mode = "wb")
}  
unzip(filename) 

## Getting dataset with all values and transform "?" to NAs
data.all <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data.all$Date <- as.Date(data.all$Date, format="%d/%m/%Y")

## Subsetting the data, remove data.all and convert it to data table to save memory
data <- data.table(subset(data.all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")))
rm(data.all)

## Converting dates
date.time <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(data.time)

## Second plot
plot(data$Global_active_power~data$Datetime, xlab="",
     ylab="Global Active Power (kilowatts)", type="l")
	 
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
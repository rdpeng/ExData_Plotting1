#Function to plot the Plot 4 of Assignment 1
#Exploratory Data Analysis

plot4 <- function() {
  # load the datasets library
  library(datasets)
  library(dplyr)
  # load the file
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  temp <- tempfile()
  download.file(url,temp)
  # stores the file as data.frame in a variable called 'dado1'
  dado1 <- read.table(unz(temp,"household_power_consumption.txt"), sep=";", header = TRUE)
  unlink(temp)
  # adjusting the date
  dado1$Date  <- as.Date(dado1$Date, "%d/%m/%Y")
  start_date <- as.Date("2007-02-01")
  end_date <- as.Date("2007-02-02")
  variavel  <- filter(dado1, (Date == start_date | Date == end_date))
  # variable to store the date and time to plot
  saida  <- strptime(paste(variavel$Date,variavel$Time,sep=" "), "%Y-%m-%d %H:%M:%S")
  ### BUILDING PLOT4 ###########
  par(mfrow=c(2,2), mar=c(2,4,2,2)+0.1)
  plot(saida,variavel$Global_active_power, ylab="Global Active Power", type = "l")
  plot(saida,variavel$Voltage, ylab="Voltage", xlab = "datetime", type = "l")
  plot(saida,(variavel$Sub_metering_1), breaks = 14, ylab="Energy sub metering", type = "l", ylim = c(0,40))
  lines(saida,variavel$Sub_metering_2,col="red")
  lines(saida,variavel$Sub_metering_3, col="blue") 
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.75, lty=c(1,1,1),col=c("black","red","blue"))
  plot(saida,variavel$Global_reactive_power, type = "l", ylab="Global_reactive_power", xlab = "datetime")
}
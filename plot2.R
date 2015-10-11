#Function to plot the Plot 2 of Assignment 1
#Exploratory Data Analysis
plot2 <- function() {
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
  saida  <- strptime(paste(variavel$Date,variavel$Time,sep=" "), "%Y-%m-%d %H:%M:%S")
  ### BUILDING PLOT2 ###########
  par(mar=c(2,5,2,2)+0.1)
  plot(saida,variavel$Global_active_power, ylab="Global Active Power (killowats)", type = "l")
}
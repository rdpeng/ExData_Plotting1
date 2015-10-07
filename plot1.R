#Function to plot the Plot 1 of Assignment 1
#Exploratory Data Analysis

plot1 <- function() {
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
  variavel$Global_active_power  <- as.numeric(variavel$Global_active_power)
  # turning into killowats measure
  variavel$Global_active_power <- variavel$Global_active_power / 1000
  ### BUILDING PLOT1 ###########
  par(mar=c(4,4,4,4)+0.1)
  hist(variavel$Global_active_power, main = "Global Active Power", xlab="Global Active Power (killowats)", 
       col = "red", breaks = 14, xlim = c(0,8), ylim = c(0,1200))
}
## Coursera.org
## Exploratory Data Analysis - Johns Hopkins University - Data Science Specialization
##

## This is the script to process the data for Project 1

## set the working directory
setwd("~/Documents/workspace/datasciencecoursera/ExploratoryDataAnalysis/Project1/ExData_Plotting1")

dt <- read.table("./data/household_power_consumption.txt", 
                 header=TRUE, 
                 sep= ";", 
                 na.strings = c("?",""))

dt$Date <- as.Date(dt$Date, format="%d/%m/%Y")
timeStamp <- paste(dt$Date, dt$Time)
dt$Time <- strptime(timeStamp, format = "%Y-%m-%d %H:%M:%S")


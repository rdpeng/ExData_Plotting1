#Clear the environment
rm(list = ls())

#Ensure there is a data folder in the working directory to store the files
if(!exists("./data")){dir.create("./data")}

#Set variable for working data directory
dataDir <- "./data/power"

#Set the file location
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

#Download the file
download.file(fileUrl, destfile = "./data/power.zip")

#Unzip the data file to the power subdirectory
unzip("./data/power.zip", exdir = dataDir)

#Store the name of the file
fileName <- list.files(path = dataDir)

#Load the data into R
power <- read.table(file.path(dataDir, fileName), sep = ";", header = TRUE,
                    na.strings = "?")

#Subset the power data to only 2/1/2007 and 2/2/2007
powerSub <- subset(power, power$Date=="1/2/2007"| power$Date == "2/2/2007")

powercheck <- subset(power, power$Date=="1/2/2007"| power$Date == "2/2/2007")

summary(powercheck)
summary(powerSub)
#Convert Date column to date type
powerSub$Date <- as.Date(powerSub$Date, "%d/%m/%Y")

#Convert Time column to  Time with strptime
powerSub$Time <- strptime(paste(powerSub$Date, powerSub$Time), format = "%Y-%m-%d %H:%M:%S", tz = "America/Los_Angeles") 
str(powerSub)

#Plot2
plot(powerSub$Date, powerSub$Global_active_power, type = "l")
identical(data.selected, powerSub)
str(data.selected)
str(powerSub)
library(compare)
compare(powerSub, data.selected)
summary(data.selected)
summary(powerSub)

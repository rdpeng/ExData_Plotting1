getwd()

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
power <- read.csv(file.path(dataDir, fileName))

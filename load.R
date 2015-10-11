################################################################################
## OS Windows 10 
## LOAD DATA 

## Set to your own folder
setwd("D:/ejercicios_R/Exploratory Data Analysis/program_assigment1")

## 
install.packages("httr")
library(httr) 

## New folder to save data
if(!file.exists("dataset")){
    dir.create("dataset")
}

## Download and unzip
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./dataset/household_power_consumption.zip")
unzip("./dataset/household_power_consumption.zip", overwrite = T,
      exdir = "./dataset")

## Read the file.
## Note that in this dataset missing values are coded as ?.
filename <- "./dataset/household_power_consumption.txt"
data <- read.table(filename,
                    sep = ";",
                   header = T,
                   colClasses = c("character", "character", rep("numeric",7)),
                   na.strings=c("?",""))

## Check the dataset has 2,075,259 rows and 9 columns.
dim(data) 

## We will only be using data from the dates 2007-02-01 and 2007-02-02.
myDates <- c("1/2/2007", "2/2/2007")
subset.data <- subset(data, Date %in% myDates)

## You may find it useful to convert the Date and Time variables to Date/Time 
## classes in R using the strptime() and as.Date() functions.

subset.data$Time <- strptime(paste(subset.data$Date, subset.data$Time),
                            "%d/%m/%Y %H:%M:%S")
subset.data$Date <- as.Date(subset.data$Date, "%d/%m/%Y")

## Clean data
rm(data)







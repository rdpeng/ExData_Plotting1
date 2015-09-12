##
## loaddata.R - load the data for project 1 of Exploratory Data Analysis
## Dataset Electric power consumption
##
filename <- "./data/household_power_consumption.txt"

##
## read in the table 
##
data <- read.table(filename,
                   header = TRUE,
                   sep = ";",
                   colClasses = c("character", "character", rep("numeric",7)),
                   na = "?")
##
## Check the dimensions -- 2075259 9
##
dim(data) 

##
## attach the dataframe
##

attach(data)

##
## Use date from two days Feb-01-2007 -> Feb-02-2007
##

subset <- Date == "1/2/2007" | Date == "2/2/2007"

##
## Create the subset of data for the two day
##
newData <- data[subset, ]

##
## attach the dataframe
##
attach(newData)

##
## convert to a datetime field and add to newData
##
x <- paste(Date, Time)
newData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(newData) <- 1:nrow(newData)

##
## Check the dimensions -- 2880   10
##
dim(newData) 

##
## attach the dataframe
##
attach(newData)

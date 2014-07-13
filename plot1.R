# Program code for Exploratory Data Analysis Project 1 Plot 1 
# Author: Yvonne Beirne FitzGerald
# Date: July 13, 2014
# Creates both the plot and the png file
# File Source: UCI Machine Learning Repository http://archive.ics.uci.edu/ml/
# Dataset: Electric power consumption  at URL
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# File is a zip, unzipped and stored the text file which is ; delimited in the working directory
# Files missing values are ?



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# VARIABLES FOR FILE PROCESSING

# R script set up using variable so code can be reused in the future

# defines the location of the workingdirectory
        myWorkingLocation <- "~/Desktop/Coursea/"

# downloaded file name of insterest 
        myFileName <- "household_power_consumption.txt"

# data variable to hold file in R console
# complete file
        myData <- ""

# data for the specific data range
        myDataSubSet <- ""

# sep charactor for parsing the file
        mySep <- ";"

# header status
        myHeader <- TRUE

# Missing NA String Char
        myNA <-"?"

# Start Date 
# note this data set is in dd/mm/yyyy
        myStartDate <- "1/2/2007"

# End Date
# note this data set is in dd/mm/yyyy
        myEndDate <- "2/2/2007"

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# LOAD FILE FROM LOCALE DIRECTORY

# load a text file from local 
# Sets working directory

        setwd(myWorkingLocation)

# sets data using correct sep ";" and defining the "?"
# note brings in the whole file does take some time

        myData <- read.table(myFileName,sep = mySep, header = myHeader, na.strings= myNA)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# SUBSET THE DATA TO THE TIME FRAME

# subsets the data to the defined begining and ending dates
        myDataSubSet <- myData[as.character(myData$Date) %in% c(myStartDate, myEndDate),]


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# PLOT DATA 

# Defines the fill for the bars in the histogram
        myColor <-"red"

# Defines X axis Label
        myXAxisLabel <- "Global Active Power (kilowatts)"

# Define Title
        myPlotTitle <- "Global Active Power"

# Makes Plot
        hist(as.numeric(as.character(myDataSubSet$Global_active_power)),col=myColor, main=myPlotTitle, xlab = myXAxisLabel)


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# SAVE PNG FILE

# Width
        myWidth <- 480

# Height
        myHeight <- 480

# File Type
        myPlotFileType <- png

# File Name
        myPlotFileName <- "plot1.png"

#Copy my plot to a PNG file from the screen
        dev.copy(myPlotFileType, file = myPlotFileName, width = myWidth , height = myHeight)

# need to close the copy device
        dev.off() 


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
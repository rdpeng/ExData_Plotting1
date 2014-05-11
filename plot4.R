# Program code for Exploratory Data Analysis Project 1 Plot 4 Complete
# Author: Yvonne Beirne FitzGerald
# Date: May 10, 2014
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
        myDataSubSet4 <- ""
        myDataSubSet3 <- ""
        myDataSubSet2 <- ""
        myDataSubSet1 <- ""
        

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
        
        

#  subsets the data to the defined begining and ending dates
        myDataSubSet4 <- myData[as.character(myData$Date) %in% c(myStartDate, myEndDate),]
        myDataSubSet3 <- myDataSubSet4 
        myDataSubSet <- myDataSubSet4 
        myDataSubSet1 <- myData[as.character(myData$Date) %in% c(myStartDate, myEndDate),]
        
# Plot 1 Adjust the Time and Date Col using as.date
        myDataSubSet1$Date<-as.Date(myDataSubSet1$Date,format='%d/%m/%Y')
        myDataSubSet1$datetime<-as.POSIXct(paste(myDataSubSet1$Date,myDataSubSet1$Time))              

# Plot 2 Adjust the Time and Date Col using as.date
        
        myDataSubSet$Date<-as.Date(myDataSubSet$Date,format='%d/%m/%Y')
        myDataSubSet$datetime<-as.POSIXct(paste(myDataSubSet$Date,myDataSubSet$Time))
        
# Plot 3 Adjust the Time and Date Cols using as.Date
        myDataSubSet3$Date<-as.Date(myDataSubSet3$Date,format='%d/%m/%Y')
        myDataSubSet3$datetime<-as.POSIXct(paste(myDataSubSet3$Date,myDataSubSet3$Time))
        
# Plot 4 Adjust the Time and Date Cols using as.Date
        myDataSubSet4$Date<-as.Date(myDataSubSet4$Date,format='%d/%m/%Y')
        myDataSubSet4$datetime<-as.POSIXct(paste(myDataSubSet4$Date,myDataSubSet4$Time))

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# PLOT DATA 

# Color
        myColor1 <- "black"
        myColor2 <- "red"
        myColor3 <- "blue"
        
# Legend Text
        myLegendText1 <- "Sub_metering_1    "
        myLegendText2 <- "Sub_metering_2    "
        myLegendText3 <- "Sub_metering_3    "
        

# Defines X axis Label
        myXAxisLabel1 <- ""
        myXAxisLabel <- ""
        myXAxisLabel3 <- "datatime"
        myXAxisLabel4 <- "datatime"

# Defines Y axis Label
        myYAxisLabel1 <- "Global Active Power (kilowatts)"
        myYAxisLabel <- "Energy sub metering"
        myYAxisLabel3 <- "Voltage"
        myYAxisLabel4 <- "Global_reactive_power"

# Defines Plot Type 
        # "p" points
        # "l" lines
        # "b" both points and lines
        # "s" steps
        # "S" other steps
        # "n" no plotting
        # "c" for the line part alone of "b"
        # "h" for historgram like or high-density vertical lines
        myPlotType1 <- "n"
        myPlotType2 <- "l"

# Define Title
        myPlotTitle <- ""
        myPlotTitle1 <- ""

# Makes Plot
        par(mfcol = c(2,2))
        par(mar = c(4,4.5,4,3))
   
    # Global Active Power top left
        #plot((myDataSubSet1$datetime),(as.numeric(as.character(myDataSubSet1$Global_active_power))),
             #col=myColor1, main=myPlotTitle1, xlab = myXAxisLabel1, ylab = myYAxisLabel1, type = myPlotType)
        #plot((myDataSubSet1$datetime),(as.numeric(as.character(myDataSubSet1$Global_reactive_power))),
            # col=myColor1, main=myPlotTitle1, xlab = myXAxisLabel1,ylab = myYAxisLabel1,type = myPlotType2)   
        
        plot((myDataSubSet1$datetime),(as.numeric(as.character(myDataSubSet1$Global_active_power))),col=myColor1,
             main=myPlotTitle1, xlab = myXAxisLabel1,ylab = myYAxisLabel1,
             type = myPlotType2)
   
    # Sub Metering bottom left
        # Makes Plot
        
        # makes basic plot without data so can add additional plots
        plot((myDataSubSet$datetime),(as.numeric(as.character(myDataSubSet$Sub_metering_1))),
             col=myColor1, main=myPlotTitle, xlab = myXAxisLabel,ylab = myYAxisLabel,type = myPlotType1)  
        
        # Sub metering 1        
        lines((myDataSubSet$datetime),(as.numeric(as.character(myDataSubSet$Sub_metering_1))),
             col=myColor1, main=myPlotTitle, xlab = myXAxisLabel,ylab = myYAxisLabel,type = myPlotType2)   
        
        # Sub metering 2        
        lines((myDataSubSet$datetime),(as.numeric(as.character(myDataSubSet$Sub_metering_2))),
              col=myColor2, main=myPlotTitle, xlab = myXAxisLabel,ylab = myYAxisLabel,type = myPlotType2) 
        
        # Sub metering 3       
        lines((myDataSubSet$datetime),(as.numeric(as.character(myDataSubSet$Sub_metering_3))),
              col=myColor3, main=myPlotTitle, xlab = myXAxisLabel,ylab = myYAxisLabel,type = myPlotType2) 
        
        # Add Legend
        legend("topright",cex=0.7, bty = "n", lty = 1, col = c(myColor1, myColor2, myColor3), legend = c(myLegendText1, myLegendText2, myLegendText3 ))
        
        
        
    # Voltage Upper Right       
        plot((myDataSubSet3$datetime),(as.numeric(as.character(myDataSubSet3$Voltage))),
             col=myColor1, main=myPlotTitle, xlab = myXAxisLabel3,ylab = myYAxisLabel3,type = myPlotType2)   
        
        

    # Global_reactive_power   Buttom Right    
        plot((myDataSubSet4$datetime),(as.numeric(as.character(myDataSubSet4$Global_reactive_power))),
             col=myColor1, main=myPlotTitle, xlab = myXAxisLabel4,ylab = myYAxisLabel4,type = myPlotType2)   


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# SAVE PNG FILE

# Width
        myWidth <- 480

# Height
        myHeight <- 480

# File Type
        myPlotFileType <- png

# File Name
        myPlotFileName <- "plot4.png"

        #par(mfrow = c(2, 2), cex=0.65)
        #png(filename="plot4maybe.png", width=480, height=480)
        
#Copy my plot to a PNG file from the screen
       dev.copy(myPlotFileType, file = myPlotFileName, width = myWidth , height = myHeight)
        
        
# need to close the copy device
        dev.off() 


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
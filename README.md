## Introduction

The code in this branch is my own code, written in R using RStudio version Version 0.98.1102 – © 2009-2014 RStudio, Inc. on a Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/600.8.9 (KHTML, like Gecko) system.

The code produces four plots, the first three of which contain one graph each and the last contains four graphs.

Data was obtained from the [UC Irvine Machine Learning Repository](http://archive.ics.uci.edu/ml/).

The specific data that is used is a subset from the [Electric power consumption](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip), a file of size 20Mb.

The subset is only the data from the two days of the 1st and 2nd of February, 2007.
##Modifications to the original data##
The code reads in the data as a combination of character and numeric vectors. 
```
classes <- sapply(tab5rows, class)
classes[1:2] <- "character"
```
The data in the Date and Time columns are combined and converted to POSIXlt format.
```
Date <- AllData$Date
Time <- AllData$Time
AllData$DateTime <- strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")
```

The Date data is furthermore converted to as.Date() and is used to subset the whole data set into the data for the two days required using:
```
FirstDayData <- AllData[AllData$Date == "2007-02-01", ]
SecondDayData <- AllData[AllData$Date == "2007-02-02", ]
```
These two subsets are combined using rbind.

The graphs are saved in .png format and represent the following:

##Plot 1##
Global Active Power frequency histogram of household global minute-averaged active power (in kilowatt)

## Plot 2##
Global active power in kilowats as a function of the day of the week, abbreviated as Thu, Fri and Sat, respectively.

##Plot 3##
Energy sub metering as a function of the day of the week, abbreviated as Thu, Fri and Sat, respectively.

##Plot 4##
Four graphs are shown in this plot, the ones on the top left and bottom left being repeats of plots 2 and 3, respectively. The plots on the top right and bottom right show the voltage and global reactive power per household as a function of the day of the week, in abbreviated format.

###Note###
While three days are plotted on the x-axis for the relevant graphs, only the data from the two days (Thursday and Friday) is used. Saturday is shown as a right cap to the axis.

## Introduction

This assignment uses data from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
datasets. In particular, we will be using the "Individual household
electric power consumption Data Set" which I have made available on
the course web site:


* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]

* <b>Description</b>: Measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.


The following descriptions of the 9 variables in the dataset are taken
from
the <a href="https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption">UCI
web site</a>:

<ol>
<li><b>Date</b>: Date in format dd/mm/yyyy </li>
<li><b>Time</b>: time in format hh:mm:ss </li>
<li><b>Global_active_power</b>: household global minute-averaged active power (in kilowatt) </li>
<li><b>Global_reactive_power</b>: household global minute-averaged reactive power (in kilowatt) </li>
<li><b>Voltage</b>: minute-averaged voltage (in volt) </li>
<li><b>Global_intensity</b>: household global minute-averaged current intensity (in ampere) </li>
<li><b>Sub_metering_1</b>: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). </li>
<li><b>Sub_metering_2</b>: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. </li>
<li><b>Sub_metering_3</b>: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.</li>
</ol>

## Loading the data





When loading the dataset into R, please consider the following:

* The dataset has 2,075,259 rows and 9 columns. First
calculate a rough estimate of how much memory the dataset will require
in memory before reading into R. Make sure your computer has enough
memory (most modern computers should be fine).

* We will only be using data from the dates 2007-02-01 and
2007-02-02. One alternative is to read the data from just those dates
rather than reading in the entire dataset and subsetting to those
dates.

* You may find it useful to convert the Date and Time variables to
Date/Time classes in R using the `strptime()` and `as.Date()`
functions.

* Note that in this dataset missing values are coded as `?`.


## Making Plots

Our overall goal here is simply to examine how household energy usage
varies over a 2-day period in February, 2007. Your task is to
reconstruct the following plots below, all of which were constructed
using the base plotting system.

First you will need to fork and clone the following GitHub repository:
[https://github.com/rdpeng/ExData_Plotting1](https://github.com/rdpeng/ExData_Plotting1)


For each plot you should

* Construct the plot and save it to a PNG file with a width of 480
pixels and a height of 480 pixels.

* Name each of the plot files as `plot1.png`, `plot2.png`, etc.

* Create a separate R code file (`plot1.R`, `plot2.R`, etc.) that
constructs the corresponding plot, i.e. code in `plot1.R` constructs
the `plot1.png` plot. Your code file **should include code for reading
the data** so that the plot can be fully reproduced. You should also
include the code that creates the PNG file.

* Add the PNG file and R code file to your git repository

When you are finished with the assignment, push your git repository to
GitHub so that the GitHub version of your repository is up to
date. There should be four PNG files and four R code files.


The four plots that you will need to construct are shown below. 


### Plot 1

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


### Plot 2

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 


### Plot 3

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 


### Plot 4

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 

## My Implementation 

This consists of 5 R scripts. The first one ,ReadProcessData.R 
 is used to read and pre-process the data for the correct time
 frame and save the reduced data set in a smaller dataset. This 
 reduced dataset is read by the 4 files (plot1.R, plot2.R, 
 plot3.R and plot4.R) that generated the desired plots.
![readprocessdata.r](ReadProcessData.R)
### ReadProcessData.R
```sh
# Read the data form the original file
d_raw= read.table("household_power_consumption.txt", sep=";",header=TRUE,as.is=TRUE)

# Process data for use
dsub<-subset(d_raw,Date=="1/2/2007" | Date=="2/2/2007")  # Filter entire data set

# Convert susetted data to corrrect type
dsub$DateTime<-paste(dsub$Date,dsub$Time) # Create date-time entry
dsub$DateTime=strptime(dsub$DateTime,format="%d/%m/%Y %H:%M:%S") # Convert to correct format
dsub$Global_active_power<-as.numeric(dsub$Global_active_power)
dsub$Global_reactive_power<-as.numeric(dsub$Global_reactive_power)
dsub$Voltage<-as.double(dsub1$Voltage)
dsub$Sub_metering_1<-as.numeric(dsub$Sub_metering_1)
dsub$Sub_metering_2<-as.numeric(dsub$Sub_metering_2)
dsub$Sub_metering_3<-as.numeric(dsub$Sub_metering_3)

# Save subsetted data for use later
write.table(dsub,"household_power_consumption_reduced.txt", sep=";")
save("dsub", file="household_power_consumption_reduced.RData")

```
### plot1.R
```sh
# Read Data
# read the data from previous file (ReadProcessData.R)
# dsub is the data name

load("household_power_consumption_reduced.RData")

# Create the png graph file

png(filename="plot1.png",width=480,height=480)

par(mfrow = c(1,1)) #add within the png context

#plot 1

hist(dsub$Global_active_power,main="Global Active Power", col="red" ,ylab="Frequency", xlab="Global Active Power(kilowatts)")

dev.off()
### End of plot1.R
```

### My Plot 1

![plot 1](plot1.png) 

### plot2.R
```sh
# Read Data
# read the data from previous file (ReadProcessData.R)
# dsub is the data name
load("household_power_consumption_reduced.RData")

# Create the png graph file

#plot 2
png(filename="plot2.png",width=480,height=480)
par(mfrow = c(1,1)) #add within the png context

with (dsub,plot(DateTime,Global_active_power,main="",type="l"
                ,col="black",ylab="Global Active Power(kilowatts)"),xlab="")
dev.off()

```

### My Plot 2

![plot 2](plot2.png) 

### plot3.R
```sh
# Read Data
# read the data from previous file (ReadProcessData.R)
# dsub is the data name
load("household_power_consumption_reduced.RData")

# Create the png graph file

#plot 3
png(file = "plot3.png")
par(mfrow = c(1,1)) #add within the png context
maxvals=range(c(dsub$Sub_metering_1,dsub$Sub_metering_2,dsub$Sub_metering_3))
plot(dsub$DateTime,dsub$Sub_metering_1,main="Global Active Power",type="l",col="black",ylab="Energy sub metering",xlab="",ylim=maxvals)
lines(dsub$DateTime,dsub$Sub_metering_2,col="red")
lines(dsub$DateTime,dsub$Sub_metering_3,col="blue")
legend("topright", pch = 1, col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))     
dev.off()

```

### My Plot 3

![plot 3](plot3.png) 

### plot4.R
```sh
# Read Data
# read the data from previous file (ReadProcessData.R)
# dsub is the data name
load("household_power_consumption_reduced.RData")

# Create the png graph file

#plot 4
png(file = "plot4.png")
par(mfrow = c(2, 2)) #add within the png context
with(dsub, {
  plot(DateTime,Global_active_power,col="black",type="l", ylab= "Global Active Power",xlab="")
  plot(DateTime,Voltage,type="l", ylab= "Voltage",col="black",xlab="datetime")
  plot(DateTime,Sub_metering_1,type="l"
       ,col="black",ylab="Energy sub metering",xlab="")
  lines(DateTime,Sub_metering_2,col="red")
  lines(DateTime,Sub_metering_3,col="blue")
  legend("topright", pch = 1, col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))     
  plot(DateTime,Global_reactive_power,col="black",type="l", ylab= "Global Reactive Power",xlab="datetime")
  
})
dev.off()
```

### My Plot 4

![plot 4](plot4.png) 

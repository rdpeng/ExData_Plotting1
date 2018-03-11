---
title: "Plot 1"
output: github_document
---



# Overview of Code
#### practice for coursera Exploratory Data Analysis from John Hopkins.

## First we calculate the memory and see if we can import the dataset

My current machine is at 16GB

using 
(rows x columns) x 120 x 8
2075259 x 9 x 120 x 8


```r
(2075259 * 9 * 120 * 8) / (2 ^ 20) #MB
```

```
## [1] 17099.61
```

```r
print("+/- 17.1 MB, plenty of room")
```

```
## [1] "+/- 17.1 MB, plenty of room"
```

## Import the Data



```r
data <- read.table('household_power_consumption.txt', colClasses = c("character", "character",
                                                 "numeric", "numeric", "numeric", "numeric", "factor", "factor", "factor"), header =TRUE, sep =';', na.strings="?")

df = data
```

### And now we have some data to use.

We will only be using data from the dates 2007-02-01 and 2007-02-02.  Let's get that sub set and format the dates


```r
head(data, 3)
```

```
##         Date     Time Global_active_power Global_reactive_power Voltage
## 1 16/12/2006 17:24:00               4.216                 0.418  234.84
## 2 16/12/2006 17:25:00               5.360                 0.436  233.63
## 3 16/12/2006 17:26:00               5.374                 0.498  233.29
##   Global_intensity Sub_metering_1 Sub_metering_2 Sub_metering_3
## 1             18.4          0.000          1.000         17.000
## 2             23.0          0.000          1.000         16.000
## 3             23.0          0.000          2.000         17.000
```

DATE DD/MM/YYYY


```r

data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

data$Date<-as.Date(data$Date,"%d/%m/%Y")
data<-data[data$Date>="2007-02-01",]
data<-data[data$Date<="2007-02-02",]
head(data,3)
 +
# cool we have dates and selected on the ones we need
```

```
## Error: <text>:10:0: unexpected end of input
## 8:  +
## 9: # cool we have dates and selected on the ones we need
##   ^
```


```r
png(filename="plot1.png", width=480, height=480)
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)",
     col="red", main="Global Active Power")
dev.off()
```

```
## quartz_off_screen 
##                 2
```












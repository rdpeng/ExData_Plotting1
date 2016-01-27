
R version 3.2.3 (2015-12-10) -- "Wooden Christmas-Tree"
Copyright (C) 2015 The R Foundation for Statistical Computing
Platform: x86_64-apple-darwin13.4.0 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[R.app GUI 1.66 (7060) x86_64-apple-darwin13.4.0]

[Workspace restored from /Users/antoniorosati/.RData]
[History restored from /Users/antoniorosati/.Rapp.history]

> setwd("/Users/antoniorosati/desktop/data/jhu/Exploratory")
> hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
> names(hpc)
[1] "Date"                  "Time"                  "Global_active_power"   "Global_reactive_power" "Voltage"              
[6] "Global_intensity"      "Sub_metering_1"        "Sub_metering_2"        "Sub_metering_3"       
> lapply(hpc, class)
$Date
[1] "factor"

$Time
[1] "factor"

$Global_active_power
[1] "numeric"

$Global_reactive_power
[1] "numeric"

$Voltage
[1] "numeric"

$Global_intensity
[1] "numeric"

$Sub_metering_1
[1] "numeric"

$Sub_metering_2
[1] "numeric"

$Sub_metering_3
[1] "numeric"

> hpc$Date[1]
[1] 16/12/2006
1442 Levels: 1/1/2007 1/1/2008 1/1/2009 1/1/2010 1/10/2007 1/10/2008 1/10/2009 1/10/2010 1/11/2007 1/11/2008 ... 9/9/2010
> hpc$Time[1]
[1] 17:24:00
1440 Levels: 00:00:00 00:01:00 00:02:00 00:03:00 00:04:00 00:05:00 00:06:00 00:07:00 00:08:00 00:09:00 00:10:00 ... 23:59:00
> hpc$DateTime <- paste(hpc$Date, hpc$Time)
> hpc$DateTime <- strptime(hpc$DateTime, "%d/%m/%Y %H:%M:%S")
> 
> start<-which(hpc$DateTime==strptime("2007-02-01", "%Y-%m-%d"))
> end<-which(hpc$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))
> hpcplots <- hpc[start:end,]
> hist(as.numeric(as.character(hpcplots$Global_active_power)), main="Global Active Power", xlab="Global Active Power (kilowatts)", col = "red", bg = "white")
> dev.copy(png, file = "plot1.png")
quartz_off_screen 
                3 
> dev.off()
quartz 
     2 
> 
##Author: Anya Mityushina
##Purpose: Exploratory Data Analysis: Course Project 1

## Examine Our overall goal here is simply to examine how household energy usage 
## varies over a 2-day period in February, 2007. Your task is to reconstruct the 
## following plots below, all of which were constructed using the base plotting system.

##Read in data

setwd("C:/Users/Anya/GitHub_AnyaMit/Exploratory Analysis with R") ##Set working directory
alldata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")

##Subset data - the long way...
feb_1 <-as.Date("01/02/2007", "%d/%m/%Y")  ##create vector for Feb 1 as.Date
feb_2 <-as.Date("02/02/2007", "%d/%m/%Y")   ##create vector for Feb 1 as.Date
alldata$Date <-as.Date(alldata$Date,"%d/%m/%Y")   ##convert Date to as.Date format
plot_data1 <-alldata[alldata$Date == feb_1,]  ##create temp subset of alldata for Feb1
plot_data2<-alldata[alldata$Date == feb_2,]  ##create temp subset of alldata for Feb2
new_set <- merge(plot_data1, plot_data2, all = TRUE)  ##create merged data from Feb1 and Feb2

##define plot variables
weekday <-strptime(paste(new_set$Date, new_set$Time, sep = " "),"%Y-%m-%d %H:%M:%S")
globalActivePower <- as.numeric(new_set$Global_active_power)

##Plot
png("plot2.png", width=480, height=480)
plot(weekday, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
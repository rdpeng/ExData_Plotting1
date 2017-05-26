library(dplyr)

#set up getting and cleaning data as a function
#getData <- function(){
#}

# file to get data
dataFileName <- "household_power_consumption.txt"
HPC<-read.table(dataFileName, header = TRUE, sep=";", na.strings = "?")
  
#HPC$Date<-as.Date(HPC$Date, format="%d/%m/%Y")
#HPC$Time<-strptime(HPC$Time, "%H:%M:%S")

#select rows for Date = '1/2/2007' OR Date = '2/2/2007'
HPC.SubsetDates<-subset(HPC, Date == "2007-02-01"| Date == "2007-02-02")

#PLot 1
png("plot1.png", width=480, height=480)
HPC.SubsetDates$Global_active_power<-as.numeric(HPC.SubsetDates$Global_active_power)
hist(HPC.SubsetDates$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")

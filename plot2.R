#Author: Gelonia Dent
#Exploratory Data- Project 1
# plot2.R 
#This code will produce a frequency histogram for the Global Active Power during the two-day
# period 2007-01-01 and 2001-02-01. 
# The output will be a PNG file named "plot2.png" of the global active power over 3 day period. 

# Set the working directory where data file and output files are stored. 

setwd("~/Desktop/Coursera_R/ExData_Plotting1")
file=paste(getwd(),"/household_power_consumption.txt",sep="")


# Load the data into variable "power" for the date range February 1,2007 to February 2, 2007

power<-read.table(file,header=TRUE,sep=";",stringsAsFactors=FALSE,na.strings="?")
power<-power[power$Date %in% c("1/2/2007", "2/2/2007"),]
power$Date <-strptime(power$Date, "%a %b %d")

#Plot the Global Active Power vs. time in days:
day.name<-c("Sun", "Mon", "Tues", "Wed", "Thu", "Fri","Sat")
day<-c("Thu", "Fri","Sat")
plot(power$Global_active_power,type="l",ylab="Global Active Power(kilowatts)",xaxt="n",xlab=" ")
axis(1,at=NULL, xaxt=day)

fname2<-paste(getwd(),"/plot2.png",sep="")
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")
plot(power$Global_active_power,type="l",ylab="Global Active Power(kilowatts)",xaxt="n",xlab=" ")
dev.off()

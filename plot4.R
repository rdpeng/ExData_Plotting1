#
#Exploratory Data Analysis
# Peer Assessments /Course Project 1
# https://class.coursera.org/exdata-035/human_grading/view/courses/975130/assessments/3/submissions
#
# Author: ANDREY ABRAMOV
# 10-12-2015
#
# Making Plots
# Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 
# 2007. Your task is to reconstruct the following plots below, all of which were constructed using the base plotting system.
#
#
#
# data set file should be in the same directory!
#
# PART 4/4---------------------------------------------------------------------------------------------------------------
# creating plot 4 -------------------------------------------------------------------------------------------------------

Sys.setlocale(category = "LC_TIME", locale = "C") # English weekday names in a plot
Sys.setenv(LANGUAGE='en')

rm(list=ls(all=TRUE)) # clean up the memory of current R session 

DataTable <- read.table('household_power_consumption.txt', header = T,sep=';') # Let's load the dataset

#select two dates from the data set
data_selected <- DataTable[which(DataTable$Date == '1/2/2007' | DataTable$Date == '2/2/2007'), ]

rm(DataTable) #clean memory

#data_selected$Global_active_power[data_selected$Global_active_power == '?'] <- NA #replace '?' to NA 
#convert factors to numeric 
data_selected$Sub_metering_1 <- as.numeric(as.character(data_selected$Sub_metering_1))
data_selected$Sub_metering_2 <- as.numeric(as.character(data_selected$Sub_metering_2))
#data_selected$Sub_metering_3 <- as.numeric(as.character(data_selected$Sub_metering_3)) #already numeric
data_selected$Global_active_power[data_selected$Global_active_power == '?'] <- NA #replace '?' to NA 
data_selected$Global_active_power <- as.numeric(as.character(data_selected$Global_active_power))
data_selected$Voltage <- as.numeric(as.character(data_selected$Voltage))
data_selected$Global_reactive_power <- as.numeric(as.character(data_selected$Global_reactive_power))

#lets prepare date time
data_selected$DT <- paste0(data_selected$Date, " ", data_selected$Time) #collect date and time 
data_selected$DT <- strptime(data_selected$DT, format = '%d/%m/%Y %H:%M:%S') #convert it to real datetime

#creating a plot
par(mfrow=c(2,2))
#plot top left
plot(x = data_selected$DT, y =data_selected$Global_active_power, ylab = "Global Active Power", ylim=c(0, 7.6), xlab = "", type = "l", cex.lab=0.7)

#plot top right
plot(x = data_selected$DT, y =data_selected$Voltage, ylab = "Voltage", xlab = "datetime", type = "l", cex.lab=0.7)

#plot bottom left

plot(x = data_selected$DT, y =data_selected$Sub_metering_1, ylab = "Energy sub metering", ylim=c(0, 38), xlab = "", type = "l", col = "black", cex.lab=0.7)
lines(x = data_selected$DT, y =data_selected$Sub_metering_2, ylab = "Energy sub metering", ylim=c(0, 38), xlab = "", type = "l", col = "red")
lines(x = data_selected$DT, y =data_selected$Sub_metering_3, ylab = "Energy sub metering", ylim=c(0, 38), xlab = "", type = "l", col = "blue")
#add a legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c(1,2,4), lty=(1),text.width = strwidth("10000000000,000,000"), cex=0.75,  bty = "n") 
# strwidth has been added due to cutting legend in a file :(

#plot bottom right
plot(x = data_selected$DT, y =data_selected$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l", cex.lab=0.7)



#copy existing hist to png-file
dev.copy(png, file="plot4.png")
dev.off() #close it



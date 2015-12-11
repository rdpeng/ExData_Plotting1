#
#Exploratory Data Analysis
# Peer Assessments /Course Project 1
# https://class.coursera.org/exdata-035/human_grading/view/courses/975130/assessments/3/submissions
#
# Author: ANDREY ABRAMOV
# 09-12-2015
#
# Making Plots
# Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 
# 2007. Your task is to reconstruct the following plots below, all of which were constructed using the base plotting system.
#
#
#
# data set file should be in the same directory!
#
# PART 2/4---------------------------------------------------------------------------------------------------------------
# creating plot 2 -------------------------------------------------------------------------------------------------------

rm(list=ls(all=TRUE)) # clean up the memory of current R session 

DataTable <- read.table('household_power_consumption.txt', header = T,sep=';') # Let's load the dataset

#select two dates from the data set
data_selected <- DataTable[which(DataTable$Date == '1/2/2007' | DataTable$Date == '2/2/2007'), ]

rm(DataTable) #clean memory

data_selected$Global_active_power[data_selected$Global_active_power == '?'] <- NA #replace '?' to NA 
#convert factors to numeric 
data_selected$Global_active_power <- as.numeric(as.character(data_selected$Global_active_power))

#lets prepare date time
data_selected$DT <- paste0(data_selected$Date, " ", data_selected$Time) #collect date and time 
data_selected$DT <- strptime(data_selected$DT, format = '%d/%m/%Y %H:%M:%S') #convert it to real datetime

Sys.setlocale(category = "LC_TIME", locale = "C") # English weekday names in a plot
Sys.setenv(LANGUAGE='en')
#creating a plot
plot(x = data_selected$DT, y =data_selected$Global_active_power, ylab = "Global Active Power (kilowatts)", ylim=c(0, 7.6), xlab = "", type = "l")

#copy existing hist to png-file
dev.copy(png, file="plot2.png")
dev.off() #close it



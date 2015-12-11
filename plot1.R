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
# PART 1/4 --------------------------------------------------------------------------------------------------------------
# creating plot 1 -------------------------------------------------------------------------------------------------------

rm(list=ls(all=TRUE)) # clean up the memory of current R session 

DataTable <- read.table('household_power_consumption.txt', header = T,sep=';') # Let's load the dataset

#select two dates from the data set
data_selected <- DataTable[which(DataTable$Date == '1/2/2007' | DataTable$Date == '2/2/2007'), ]
rm(DataTable) #clean memory

data_selected$Global_active_power[data_selected$Global_active_power == '?'] <- NA #replace '?' to NA 
#convert factors to numeric 
data_selected$Global_active_power <- as.numeric(as.character(data_selected$Global_active_power))

#creating a historgam
hist(data_selected$Global_active_power, col = "Red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
     main = "Global Active Power", ylim=c(0, 1200))

#copy existing hist to png-file
dev.copy(png, file="plot1.png")
dev.off() #close it



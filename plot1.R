### 06/05/2014_ Plotting Assignment-1 done for the Coursera course "Exploratory Data Analysis" of "Data Science" Specialization track.
##remove old data
rm(list=ls())
###reading data into R (you have to put the data into your working directory or define the path):
epc<- read.table("household_power_consumption.txt", sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

### Obtaining the subset of the data related to two days:
Subset<- subset(epc, (epc$Date == "1/2/2007" | epc$Date== "2/2/2007"))

###Creating Plot1 for the Assignment:
##Create the PNG including width and height
png("plot1.png", width=480, height= 480)
##Create the histogram with labels 
hist(Subset$Global_active_power, col= "red", xlab= "Global Active Power (kilowatts)", ylab= "Frequency", main= "Global Active Power")
##Close the file device
dev.off()

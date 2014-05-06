### 06/05/2014_ Plotting Assignment-1 done for the Coursera course "Exploratory Data Analysis" of "Data Science" Specialization track.
##remove old data
rm(list=ls())
###reading data into R (you have to put the data into your working directory or define the path):
epc<- read.table("household_power_consumption.txt", sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

### Obtaining the subset of the data related to two days:
Subset<- subset(epc, (epc$Date == "1/2/2007" | epc$Date== "2/2/2007"))

##As suggested by the Assignment, I am changing the class of the date variable from character to date:
Subset$Date <- as.Date(Subset$Date, format = "%d/%m/%Y")
##Combining the Date and Time variable. Than I am creating a new column in dataset named "DateTime":
Subset$DateTime <- as.POSIXct(paste(Subset$Date, Subset$Time))

###Creating Plot1 for the Assignment:
##Create the PNG including width and height
png("plot2.png", width=480, height= 480)
##Create the histogram with labels
plot(Subset$DateTime, Subset$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="")
##Close the file device
dev.off()

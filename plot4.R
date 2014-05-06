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
png("plot4.png", width = 480, height = 480)
##Adding 4 plots in col-wised manner
par(mfcol=c(2,2))
##Add the 1 plot
plot(Subset$DateTime, Subset$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="")
##Add the 2 plot
plot(Subset$DateTime, Subset$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
##Add the red line
lines(Subset$DateTime, Subset$Sub_metering_2, type="l", col="red")
##Add the blue line
lines(Subset$DateTime, Subset$Sub_metering_3, type="l", col="blue")
##Add the legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("black", "red", "blue"))
##Add the 3 plot
plot(Subset$DateTime, Subset$Voltage, type="l", xlab="datetime", ylab="Voltage")
##Add the 4 plot
plot(Subset$DateTime, Subset$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
##Close the file device
dev.off()

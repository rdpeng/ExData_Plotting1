setwd("C://Users/Lisa/Desktop/data science/household power consumption")  ##set the working directory to the folder where data will be downloaded
file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"  ##web site where the data is located
download.file(file_url, destfile= "household_power_consumption.zip", mode="wb")  ##download zipped file to the working directory
unzip("household_power_consumption.zip", "household_power_consumption.txt")  ##unzip file        

hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings= "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")) 
hpc <- hpc[hpc$Date %in% c("1/2/2007", "2/2/2007"), ]  ##extract the data to only incude dates feb. 1 and feb.2, 2007
hpc$datetime <- paste(hpc$Date, hpc$Time) ## create a new column that includes both Date and Time as character string
hpc$datetime <- strptime(hpc$datetime, "%d/%m/%Y %H:%M:%S", tz="UTC") ##convert the datetime column from chracter to POSIX class

png(filename= "Plot3.png", width=480, height=480, units="px", pointsize=12, type="cairo-png")
plot(hpc$datetime, hpc$Sub_metering_1, type ="l", xlab="", ylab="Energy sub metering")  ##plot a line graph for sub_metering_1 across the 2 days and changed the y label 
lines(hpc$datetime, hpc$Sub_metering_2, col="red")  ##add a red line representing sub_metering_2 across the days
lines(hpc$datetime, hpc$Sub_metering_3, col="blue")  ##add a blue line representing sub_metering_3 across the 2 days
legend("topright", legend= c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "), lwd=1, col=c("black", "red", "blue")) ##create a legend in the top right corner of the graph with the proper line assignments
dev.off()  ##close the png device to view the plot saved in the working directory

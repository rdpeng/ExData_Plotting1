setwd("C://Users/Lisa/Desktop/data science/household power consumption")  ##set the working directory to the folder where data will be downloaded
file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"  ##web site where the data is located
download.file(file_url, destfile= "household_power_consumption.zip", mode="wb")  ##download zipped file to the working directory
unzip("household_power_consumption.zip", "household_power_consumption.txt")  ##unzip file        
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings= "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")) 

hpc <- hpc[hpc$Date %in% c("1/2/2007", "2/2/2007"), ]  ##extract the data to only incude dates feb. 1 and feb.2, 2007
hpc$datetime <- paste(hpc$Date, hpc$Time) ## create a new column that includes both Date and Time as character string
hpc$datetime <- strptime(hpc$datetime, "%d/%m/%Y %H:%M:%S", tz="UTC") ##convert the datetime column from chracter to POSIX class

png(filename="Plot4.png", width=480, height=480, pointsize=10, type="cairo-png")  ##create a png file with the proper dimensions and type
par(mfrow=c(2,2)) ##create a display of 2 rows and 2 columns, with rows filled in first
plot(hpc$datetime, hpc$Global_active_power, type ="l", xlab="", ylab="Global Active Power (kilowatts)")  ##same as Plot2.png
plot(hpc$datetime, hpc$Voltage, type="l", xlab="datetime", ylab= "Voltage")  ##create a new plot that will be displayed in first row, second column
plot(hpc$datetime, hpc$Sub_metering_1, type ="l", xlab="", ylab="Energy sub metering")  ##same as Plot3.png
        lines(hpc$datetime, hpc$Sub_metering_2, col="red")  ##same as Plot3.png
        lines(hpc$datetime, hpc$Sub_metering_3, col="blue") ##same as Plot3.png 
        legend("topright", legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, bty="n", col=c("black", "red", "blue")) ##create a legend without a box in topright corner 
plot(hpc$datetime, hpc$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")  ##create a new plot that will be displayed in second row, second column
dev.off()  ##close the png device to view the plot saved in the working directory

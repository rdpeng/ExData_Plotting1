setwd("C://Users/Lisa/Desktop/data science/household power consumption")  ##set the working directory to the folder where data will be downloaded
file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"  ##web site where the data is located
download.file(file_url, destfile= "household_power_consumption.zip", mode="wb")  ##download zipped file to the working directory
unzip("household_power_consumption.zip", "household_power_consumption.txt")  ##unzip file        
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings= "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")) 

hpc <- hpc[hpc$Date %in% c("1/2/2007", "2/2/2007"), ]  ##extract the data to only incude dates feb. 1 and feb.2, 2007
hpc$datetime <- paste(hpc$Date, hpc$Time) ## create a new column that includes both Date and Time as character string
hpc$datetime <- strptime(hpc$datetime, "%d/%m/%Y %H:%M:%S", tz="UTC") ##convert the datetime column from chracter to POSIX class

hist(hpc$Global_active_power, col= "red", main="Global Active Power", xlab= "Global Active Power (kilowatts)", ylab= "Frequency") ##creates a histogram of the Global Active Power across the 2 days
dev.copy(png, file= "Plot1.png")  ##copy the histogram to a png file
dev.off()  ##close the png device to view the plot saved in the working directory

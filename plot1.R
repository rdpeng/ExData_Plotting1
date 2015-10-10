
## Sets destination directory where data file exists.
destdir <- "household_power_consumption.txt"

## reads data from the text files and puts into a data frame.
powerData <- read.csv(destdir, header = TRUE, sep = ";")

##head(powerData)

## Subsets the data for 2 days 
reqData <- subset(powerData, Date == "1/2/2007" | Date == "2/2/2007", 
                  select=Date: Sub_metering_3)


## Converts the requires variable data into numeric
x <- as.numeric(as.character(reqData$Global_active_power))

##dev.cur()
##dev.off()

## Code to save the file as plot1.png
pngFilelocation <- ("C://Sudha//Data Science - Coursera//Exploratory Data Analysis//Project 1//plot1.png")
png(file = pngFilelocation ,width = 480, height = 480, units = "px", bg = "transparent")

## Generates the Histogram
hist(x, breaks=11, col="Red", ylim = c(0, 1200), xlab = "Global Active Power(kilowatts)", main="Global Active Power")




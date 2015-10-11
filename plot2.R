## Sets detination directory where data file exists.
destdir <- "household_power_consumption.txt"

## reads data from the text files and puts into a data frame.
powerData <- read.csv(destdir, header = TRUE, sep = ";")

##head(powerData)

## Subsets the data for 2 days 
reqData <- subset(powerData, Date == "1/2/2007" | Date == "2/2/2007", 
                  select=Date: Sub_metering_3)


dates <- c("2007-02-01","2007-02-02","2007-02-03")
d <- as.Date(dates) # format="%Y-%m-%d"

xmin <- min(d)
xmax <- max(d)
x <- weekdays(d)

weekdays(c(xmin,xmax))

## Converts the requires variable data into numeric
y <- as.numeric(as.character(reqData$Global_active_power))


## Code to save the file as plot1.png
pngFilelocation <- ("C://Sudha//Data Science - Coursera//Exploratory Data Analysis//Project 1//plot2.png")
png(file = pngFilelocation ,width = 480, height = 480, units = "px", bg = "transparent")

## Generates the Line Plot
plot(y, type="l",xaxt="n", xlab = "", ylab = "Global Active Power(kilowatts)")
axis(1, at=seq_along(d), labels=x, las=1)


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

## Sub_metering_1 Data
SM1 <- as.numeric(as.character(reqData$Sub_metering_1))

## Sub_metering_2 Data
SM2 <- as.numeric(as.character(reqData$Sub_metering_2))


## Sub_metering_3 Data
SM3 <- as.numeric(as.character(reqData$Sub_metering_3))



## Converts the requires variable data into numeric
y <- as.numeric(as.character(reqData$Sub_metering_1))


## Code to save the file as plot1.png
pngFilelocation <- ("C://Sudha//Data Science - Coursera//Exploratory Data Analysis//Project 1//plot3.png")
png(file = pngFilelocation ,width = 480, height = 480, units = "px", bg = "transparent")

## Generates the Line Plot for all three sub metering plots
plot(SM1, type="l",xaxt="n", xlab = "", ylab = "Energy sub metering", col="black")
lines(SM2, type="l",xaxt="n", xlab = "", ylab = "Energy sub metering", col="red")
lines(SM3, type="l",xaxt="n", xlab = "", ylab = "Energy sub metering", col="blue")

axis(1, at=seq_along(d), labels=x, las=1)
legend(1920,39.5, # places a legend at the appropriate place 
       c("Sub metering_1","Sub metering_2","Sub metering_3"), # puts text in the legend 
       
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       
       lwd=c(1,1,1),col=c("black","red","blue")) # gives the legend lines the correct color and width







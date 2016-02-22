
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
global_active_power <- as.numeric(as.character(reqData$Global_active_power))


## Converts the requires variable data into numeric
global_reactive_power <- as.numeric(as.character(reqData$Global_reactive_power))

## Converts the requires variable data into numeric
voltage <- as.numeric(as.character(reqData$Voltage))

## Sub_metering_1 Data
SM1 <- as.numeric(as.character(reqData$Sub_metering_1))

## Sub_metering_2 Data
SM2 <- as.numeric(as.character(reqData$Sub_metering_2))

## Sub_metering_3 Data
SM3 <- as.numeric(as.character(reqData$Sub_metering_3))

## Code to save the file as plot1.png
pngFilelocation <- ("C://XXX//Data Science - Coursera//Exploratory Data Analysis//Project 1//plot4.png")
png(file = pngFilelocation ,width = 480, height = 480, units = "px", bg = "transparent")


## Set up matrix to display Multiple plots in one graph
par(mfrow=c(2,2))
## Generates the Plot(c(1,1))
## Generates the Line Plot
plot(global_active_power, type="l",xaxt="n", xlab = "", ylab = "Global Active Power")
axis(1, at=seq_along(d), labels=x, las=1)


## Generates the Plot(c(1,2))
plot(voltage, type="l",xaxt="n", xlab = "datetime", ylab = "Voltage")
axis(1, at=seq_along(d), labels=x, las=1)

## Generates the Plot(c(2,1))
plot(SM1, type="l",xaxt="n", xlab = "", ylab = "Energy sub metering", col="black")
lines(SM2, type="l",xaxt="n", xlab = "", ylab = "Energy sub metering", col="red")
lines(SM3, type="l",xaxt="n", xlab = "", ylab = "Energy sub metering", col="blue")

axis(1, at=seq_along(d), labels=x, las=1)

legend("topright", # places a legend at the appropriate place 
       bty = "n",
       c("Sub metering_1","Sub metering_2","Sub metering_3"), # puts text in the legend 
       
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       
       lwd=c(1,1,1),col=c("black","red","blue")) # gives the legend lines the correct color and width


## Generates the Plot(c(2,2))
plot(global_reactive_power, type="l",xaxt="n", xlab = "datetime", ylab = "Global_reactive_power")
axis(1, at=seq_along(d), labels=x, las=1)







### Coursera Explorator Data Analysis Course Project1
### Sylwester Dec

### plot1.R

## Getting data

library(data.table)
getwd()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "PowerCons.zip")
unzip(zipfile = "PowerCons.zip", overwrite = TRUE)
data<-read.table("household_power_consumption.txt",header = TRUE, sep = ';', na.strings = "?")


## Convert Date Column to date format - Date1 column
data$Date1 <- as.Date(data$Date, format = "%d/%m/%Y")

## Subset data to 2007-02-01 and 2007-02-02
data <- subset(data, subset = (Date1>="2007-02-01" & Date1<="2007-02-02"))

## Convert Date & Time to  DateTime
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")


## axis names
X <- "Global Active Power (kilowats)"
Y <- "Frequency"

## Plot1
hist(data$Global_active_power, main="Global Active Power", xlab=X, ylab=Y, col="Red", cex.sub=0.8)

## export png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


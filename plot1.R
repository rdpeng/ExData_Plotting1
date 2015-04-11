## Plotting data for exploratory data analysis
##
## ---------------------------------------------

## ---- Read in the file

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE)

## ---- Subset the data to include 2007-02-01 to 2007-02-02

data2 <- rbind( subset(data,Date=="1/2/2007"),subset(data,Date=="2/2/2007"))

data <- data.frame()

## ---- Convert the Date and Time variables to Date/Time classes
## ---- in R using the strptime() and as.Date() functions. 

data2$Time  <- strptime(paste(data2$Date,data2$Time),format = "%d/%m/%Y %H:%M:%S", tz = "")
data2$Date <- as.Date(data2$Date,"%d/%m/%Y")

## ---- Construct the plot in a 480 x 480 PNG
## ---- plot1.png

png("plot1.png", width = 480, height = 480)
hist(as.numeric(data2$Global_active_power),main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatt)")
dev.off()

## ---- The End
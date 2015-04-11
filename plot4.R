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
## ---- plot4.png
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(data2$Time, as.numeric(data2$Global_active_power), type = "l", xlab="", ylab="Global Active Power (kilowatt)")
plot(data2$Time, as.numeric(data2$Voltage), type = "l",xlab="datetime", ylab="Voltage")
plot(data2$Time, as.numeric(data2$Sub_metering_1), type = "l", xlab="", ylab="Energy sub metering")
lines(data2$Time, as.numeric(data2$Sub_metering_2), type = "l", xlab="", ylab="Energy sub metering",col="red")
lines(data2$Time, as.numeric(data2$Sub_metering_3), type = "l", xlab="", ylab="Energy sub metering",col="blue")
legend("topright", 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=c(1,1,1),
       lwd=c(2.5,2.5,2.5),
       col=c("black","red","blue"),
       bty = "n",
       cex = 1, 
       pt.cex = cex    
) 
plot(data2$Time, as.numeric(data2$Global_reactive_power), type = "l", xlab="datetime", ylab="Global_reactive_power")
dev.off()

## ---- The End
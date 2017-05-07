##  RScript that plots the following graphs using the 
##  "Individual household electric power consumption Data Set" for 
##  the dates 01 Feb 2007 and 02 Feb 2007.
##     i) Line chart of Global Active Power
##    ii) Line charts on the three Energy Sub-Meterings
##   iii) Line chart on the Voltage
##    iv) Line chart on the Global Reactive Power
##
##  Code is also included to copy the generated graph to a png file.


plot4 <- function() {

df <- read.table("household_power_consumption.txt", sep = ";", 
                 header = TRUE, na.strings = "?")

df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

df2 <- subset(df, as.Date(DateTime) == "2007-02-01" | 
                      as.Date(DateTime) == "2007-02-02")

par(mfcol = c(2,2))

with(df2, plot(DateTime,  Global_active_power, type = "l", 
               xlab="", ylab = "Global Active Power"))

with(df2, plot(DateTime, Sub_metering_1, type = "l", 
               xlab="", ylab = "Energy sub metering"))

lines(df2$DateTime, df2$Sub_metering_2, col = "red")

lines(df2$DateTime, df2$Sub_metering_3, col = "blue")

legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col= c("black", "red", "blue"), lty = 1)

with(df2, plot(DateTime, Voltage, type = "l", 
               xlab="datetime", ylab = "Voltage"))

with(df2, plot(DateTime, Global_reactive_power, type = "l", 
               xlab="datetime", ylab = "Global_reactive_power"))

dev.copy(png, file = "plot4.png", width = 480, height = 480)

dev.off()

}
##  RScript that plots line charts on the three energy sub meterings from the 
##  "Individual household electric power consumption Data Set" for 
##  the dates 01 Feb 2007 and 02 Feb 2007.
##  Code is also included to copy the generated graph to a png file.


plot3 <- function() {

df <- read.table("household_power_consumption.txt", sep = ";", 
                 header = TRUE, na.strings = "?")

df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

df2 <- subset(df, as.Date(DateTime) == "2007-02-01" | 
                      as.Date(DateTime) == "2007-02-02")

with(df2, plot(DateTime, Sub_metering_1, type = "l", 
               xlab="", ylab = "Energy sub metering"))

lines(df2$DateTime, df2$Sub_metering_2, col = "red")

lines(df2$DateTime, df2$Sub_metering_3, col = "blue")

legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col= c("black", "red", "blue"), lty = 1)

dev.copy(png, file = "plot3.png", width = 480, height = 480)

dev.off()

}
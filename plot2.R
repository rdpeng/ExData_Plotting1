##  RScript that plots a line chart on Global Active Power from the 
##  "Individual household electric power consumption Data Set" for 
##  the dates 01 Feb 2007 and 02 Feb 2007.
##  Code is also included to copy the generated graph to a png file.


plot2 <- function() {

df <- read.table("household_power_consumption.txt", sep = ";", 
                 header = TRUE, na.strings = "?")

df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

df2 <- subset(df, as.Date(DateTime) == "2007-02-01" | 
                  as.Date(DateTime) == "2007-02-02")

with(df2, plot(DateTime,  Global_active_power, type = "l", 
               xlab="", ylab = "Global Active Power (kilowatts)"))


dev.copy(png, file = "plot2.png", width = 480, height = 480)

dev.off()

}
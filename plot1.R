##  RScript that plots a histogram on Global Active Power from the 
##  "Individual household electric power consumption Data Set" for 
##  the dates 01 Feb 2007 and 02 Feb 2007.
##  Code is also included to copy the generated graph to a png file.


plot1 <- function() {

df <- read.table("household_power_consumption.txt", sep = ";", 
                 header = TRUE, na.strings = "?")

df$Date <- as.Date(strptime(df$Date, "%d/%m/%Y"))

df2 <- subset(df, Date == "2007-02-01" | Date == "2007-02-02")

hist(df2$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)",main = "Global Active Power")

dev.copy(png, file = "plot1.png", width = 480, height = 480)

dev.off()

}
# Place the household_power_consumption file in the working directory set.
setwd("C:/Data")
file <- c("./household_power_consumption.txt")
#Extratract and load only the required data into R. i.e., data between  from the dates 2007-02-01 and 2007-02-02.
install.packages("sqldf")
library(sqldf)
data_subset <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

dateTime  <- as.POSIXlt(paste(as.Date(data_subset$Date, format="%d/%m/%Y"), data_subset$Time, sep=" "))
png(filename = "plot1.png")

hist(data_subset$Global_active_power, main = "Global Active Power", ylab = "Frequency", 
     xlab = "Global Active Power (kilowatts)", col = "red", breaks = 13, ylim = c(0, 
                                                                                  1200), xlim = c(0, 6), xaxp = c(0, 6, 3))
dev.off() 

rm(list = ls())
library(sqldf)
setwd("C:\\Users\\tavanai2\\Box Sync\\Coursera\\Data Science Specialization\\4. Exploratory Data Analysis\\W1_hw")

house <- file("house.txt")
data  <- sqldf("select * from house where Date == '1/2/2007' or Date == '2/2/2007'",
               file.format = list(header = TRUE, sep = ";"))
close(house)
 
DateTime <- paste(as.character(as.Date(data[, "Date"], format="%d/%m/%Y")),data[, "Time"])
DateTime <- as.POSIXlt(DateTime)

setwd("C:\\Users\\tavanai2\\Box Sync\\Coursera\\Data Science Specialization\\4. Exploratory Data Analysis\\ExData_Plotting1")
png("plot3.png", width = 480, height = 480) 
plot(DateTime, data[,"Sub_metering_1"], type = "l", xlab="",
     ylab="Energy sub metering", cex.lab=.6)
lines(DateTime, data[,"Sub_metering_2"], col="red")
lines(DateTime, data[,"Sub_metering_3"], col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty=c(1,1,1))
dev.off()

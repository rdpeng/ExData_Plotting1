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
png("plot4.png", width = 480, height = 480) 
par(mfrow=c(2,2))
plot(DateTime, data[,"Global_active_power"], type="l", xlab="",
     ylab="Global Active Power", cex.lab=1)
plot(DateTime, data[,"Voltage"], type="l", xlab="datetime",
     ylab="Voltage", cex.lab=1)
plot(DateTime, data[,"Sub_metering_1"], type = "l", xlab="",
     ylab="Energy sub metering", cex.lab=1)
lines(DateTime, data[,"Sub_metering_2"], col="red")
lines(DateTime, data[,"Sub_metering_3"], col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty=c(1,1,1), box.lty=0, inset =.02,
       ncol=1, text.width=1, cex=.5, lwd = 1, seg.len=c(3,3,3), xjust=0, yjust = 0,
       x.intersp = 20, y.intersp =1, adj = c(1.1, .5))
plot(DateTime, data[,"Global_reactive_power"], type = "s", ylim = c(0,.5),
     ylab = "Global_reactive_power", xlab = "datetime")
dev.off()
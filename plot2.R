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
png("plot2.png", width = 480, height = 480) 
plot(DateTime, data[,"Global_active_power"], type="l", xlab="",
     ylab="Global Active Power (kilowatts)", cex.lab=.6)
dev.off()

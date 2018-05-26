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
png("plot1.png", width = 480, height = 480) 
hist(data[,"Global_active_power"], col = "red", ylim = c(0,1200), cex.axis=.8, cex.lab=.8,
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

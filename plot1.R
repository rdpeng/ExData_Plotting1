

library(data.table)

setwd("/Users/earthkwaque/Projects/rdata/coursera/data/")

fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# download.file(fileurl, destfile = "household_power_consumption.zip", method="curl")
# unzip("household_power_consumption.zip", overwrite = TRUE)
file <- "household_power_consumption.txt"

ALL <- suppressWarnings(fread(file, na.strings="?"))
setkey(ALL, Date)

DT <- ALL[c("1/2/2007","2/2/2007"),]
DT$Global_active_power <- as.numeric(DT$Global_active_power)


par(mfrow=c(1,1))
hist(DT$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", 
     cex.lab = 0.5, cex.main = 0.8, cex.axis = 0.6)

dev.copy(png, file = "plot1.png")
dev.off()


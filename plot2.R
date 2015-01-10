library(data.table)

setwd("/Users/earthkwaque/Projects/rdata/coursera/data/")

fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# download.file(fileurl, destfile = "household_power_consumption.zip", method="curl")
# unzip("household_power_consumption.zip", overwrite = TRUE)
file <- "household_power_consumption.txt"

ALL <- suppressWarnings(fread(file, na.strings="?"))
setkey(ALL, Date)

DT <- ALL[c("1/2/2007","2/2/2007"),]

plot(DT$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "", cex.axis= 0.6, cex.lab = 0.6, axes=FALSE)
axis(1, at=c(1,2880/2,2880), lab=c("Thu", "Fri", "Sat"), cex.axis=0.8)
axis(2, cex.axis=0.8, ylab = "Global Active Power (kilowatts)")
box()

dev.copy(png, file = "plot2.png")
dev.off()
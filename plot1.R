setwd("~/R/Course 4 (Exploratory Data Analysis)/C4W1/")
library(data.table)

if(!file.exists("household_power_consumption.txt")) {
        fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileURL, destfile = "./household_power_consumption.zip", method = "curl")
        unzip("./household_power_consumption.zip")
}

## Load data into memory
power <- read.csv2("household_power_consumption.txt", header = TRUE,
                   comment.char = "", na.strings = "?", nrows = 2085259,
                   stringsAsFactors = FALSE)

dt <- power[power$Date %in% c("1/2/2007","2/2/2007"),]
dt$datetime <- strptime(paste(dt$Date,dt$Time), "%d/%m/%Y %H:%M:%S")
dt$Global_active_power <- as.numeric(dt$Global_active_power)


## First plot
png(file="plot1.png",width=480,height=480)
hist(dt$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.off()

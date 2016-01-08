data <- read.table("household_power_consumption.txt",header= TRUE, sep =';', colClasses = "character", na.strings = "?")
data <- subset(data, as.Date(data$Date, "%d/%m/%Y") >= "2007-02-01" & as.Date(data$Date, "%d/%m/%Y") <= "2007-02-02")
cols <- c(3:9)
data [, cols]<- apply (data[ ,cols], 2, function (x) as.numeric (x))
png (file="plot1.png")
hist (data[, 3], xlab = "Global Active Power (Kilowatts)", main = "Global Active Power", col= "red")
dev.off()


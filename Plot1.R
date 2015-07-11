#set working directory
setwd("C:/Users/tejones/Desktop/Coursera/exdata-data-household_power_consumption")

library(gsubfn)
library(Hmisc)
library(chron)
#install.packages("gsubfn")

L <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

L$Date <- as.Date(L$Date, format = "%d/%m/%Y")

L3 <- L[L$Date == "2007-02-02" | L$Date == "2007-02-01",] #| L$Date == "01/02/2007"),]

L3$Global_active_power <- as.numeric(as.character(L3$Global_active_power))

#plot 1
png(file = "plot1.png",  width = 480, height = 480, bg = "transparent")
hist(L3$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()

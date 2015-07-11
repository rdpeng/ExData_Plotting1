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

L3$Date2 <- as.POSIXct(paste(L3$Date,L3$Time), "%d/%m/%Y %H:%M:%S" )

# plot 2
png(file = "plot2.png",  width = 480, height = 480, bg = "transparent")
plot(L3$Date2, L3$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)" , xlab = "")
dev.off()

hpower <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = F, header = T)

hpower1 <- hpower[hpower$Date == "1/2/2007"| hpower$Date == "2/2/2007", ]

png("plot1.png")

hist(as.numeric (hpower1$Global_active_power), col = "red", main = "Global Active Power", xlab ="Global Active Power (kilowatts)" )

dev.off()
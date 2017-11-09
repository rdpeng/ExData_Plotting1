hpower <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = F, header = T)

hpower1 <- hpower[hpower$Date == "1/2/2007"| hpower$Date == "2/2/2007", ]

png("plot2.png")

day <- strptime(paste(hpower1$Date, hpower1$Time ), "%d/%m/%Y %H:%M:%S")

plot(day, as.numeric (hpower1$Global_active_power), type= "l", xlab = "", ylab ="Global Active Power (kilowatts)" )

dev.off()
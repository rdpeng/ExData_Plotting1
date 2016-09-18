source("data.R")
png("plot1.png")
hist(target.house$Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()

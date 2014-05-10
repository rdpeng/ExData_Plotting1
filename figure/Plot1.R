house <- read.table("household_power_consumption.txt", header=T, sep=";")  

summary(house)
house1 <- subset(house, Date=="1/2/2007"|Date =="2/2/2007")
house1
#Plot 1
house1$Global_active_power <- as.numeric(house1$Global_active_power)
png(filename="Plot1.png",width=480,height=480)
hist(house1$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

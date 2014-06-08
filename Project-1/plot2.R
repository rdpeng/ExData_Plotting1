data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
wdata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
png("plot2.png", width=480, height=480, units="px")
plot( as.numeric(as.character(wdata$Global_active_power)), type="l", xaxt="n", ylab="Global Active Power (kilowatts)", xlab="")
axis(1,at=1:3, lab=c("Thu", "Fri", "Sat"))

dev.off()

hpc = read.table("household_power_consumption 2.txt",sep = ";", header = T)
hpc_true=subset(hpc, Date %in% c("1/2/2007","2/2/2007"))


DT <- strptime(paste(hpc_true$Date, hpc_true$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
NumGAP= as.numeric(hpc_true$Global_active_power)
plot(DT, NumGAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

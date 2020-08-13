hpc = read.table("household_power_consumption 2.txt",sep = ";", header = T)
hpc_true=subset(hpc, Date %in% c("1/2/2007","2/2/2007"))
png("plot1.png", width=480, height=480)
NumGAP= as.numeric(levels(hpc_true$Global_active_power))[hpc_true$Global_active_power]
hist(NumGAP,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()


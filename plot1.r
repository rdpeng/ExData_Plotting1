EPC_data<-"./household_power_consumption.txt"
data<-read.table(EPC_data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
MyData<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
ActivePower<-as.numeric(MyData$Global_active_power)

png("plot1.png", width=480, height=480)
hist(ActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

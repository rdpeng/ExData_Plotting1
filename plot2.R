Electric_Power_consumption_data<-"./exdata-data-household_power_consumption (1)/household_power_consumption.txt"
data<-read.table(Electric_Power_consumption_data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
MyData<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
datetime<-strptime(paste(MyData$Date, MyData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
ActivePower<-as.numeric(MyData$Global_active_power)

png("plot2.png", width=480, height=480)
plot(datetime, ActivePower, type="l", xlab=" ", ylab="Global Active Power (kilowatts)")
dev.off()

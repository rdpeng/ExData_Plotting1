Alldata<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")
Alldata$Date2<-as.Date(Alldata$Date, format = "%d/%m/%Y")
data2<-subset(Alldata, Date2 == as.Date("2007-02-01") | Date2 == as.Date("2007-02-02"))
data2$time2<- strptime(paste(data2$Date, data2$Time), format = "%d/%m/%Y %H:%M:%S")


#plot 1
png("plot1.png", width=480, height=480)
hist(as.numeric(data2$Global_active_power), col = "red", main ="Global Active Power", xlab = "Global Active Power(kilowatts)", ylab = "Frequency")
dev.off()

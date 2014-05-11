power <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")
power$Date <-as.Date(power$Date, format='%d/%m/%Y')
powerDate <- power[power$Date %in%  as.Date(c('2007-02-01','2007-02-02')), ]
png('plot1.png')
hist(as.numeric(as.character(powerDate[,3])),xlab="Global Active Power(Kilowatts))",col = "red",main = "Global Active Power")
dev.off()

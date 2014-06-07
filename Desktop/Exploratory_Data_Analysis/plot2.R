#Read
power <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")
power$Date <-as.Date(power$Date, format='%d/%m/%Y')
powerDate <- power[power$Date %in%  as.Date(c('2007-02-01','2007-02-02')), ]
datetime<-as.POSIXct(paste(powerDate$Date,powerDate$Time))
powerDate <- cbind(powerDate,datetime)
png('plot2.png')
plot(powerDate$datetime,as.numeric(as.character(powerDate$Global_active_power)), type = "l",xlab="DateTime",ylab= "Global Active Power(Kilowatts)")
dev.off()

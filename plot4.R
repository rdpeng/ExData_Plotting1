##setwd("C:/Users/ocsuser/Desktop/Coursera work/EDA/")
dt <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings ="?") ## read data file
head(dt)
str(dt)
dt2 <- dt[dt$Date %in% c("1/2/2007", "2/2/2007"),]  ## new data frame of subset during 2007-02-01~02
dt2$datetime <- strptime(paste(dt2[,1],dt2[,2]), "%d/%m/%Y %H:%M:%S") ## make a vector of date and time class changed from dt2$Date_Time 
head(dt2)
str(dt2)

png(file="plot4.png", width=480, height=480, units="px")
par(mfcol=c(2, 2))
with(dt2, plot(datetime, Global_active_power, type="l", xlab="datetime", ylab="Global Active Power(kilowatts)"))
with(dt2, plot(datetime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(dt2, lines(datetime, Sub_metering_1, col="black"))
with(dt2, lines(datetime, Sub_metering_2, col="red"))
with(dt2, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="n")
with(dt2, plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage"))
with(dt2, plot(datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global-reactive_power"))
dev.off()
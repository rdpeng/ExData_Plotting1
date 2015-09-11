##setwd("C:/Users/ocsuser/Desktop/Coursera work/EDA/")
library(dplyr)
dt <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings ="?") ## read data file
head(dt)
str(dt)
dt2 <- mutate(dt, Date_Time = paste(dt[,1],dt[,2]))  ## add new variables of date and time
datetime <- strptime(dt2[,10], "%d/%m/%Y %H:%M:%S")  ## make a vector of date and time class changed from dt2$Date_Time 
dt2 <- cbind(dt2, datetime) ## add a date and time class vector as 'datetime' in dt2
head(dt2)
str(dt2)
dt3 <- dt2[(dt2[,11]>="2007-02-01 00:00:00" & dt2[,11]<"2007-02-02 24:00:00"),] ## new data frame of subset during 2007-02-01~02
head(dt3)
str(dt3)

png(file="plot4.png", width=480, height=480, units="px")
par(mfcol=c(2, 2))
with(dt3, plot(datetime, Global_active_power, type="l", xlab="datetime", ylab="Global Active Power(kilowatts)"))
with(dt3, plot(datetime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(dt3, lines(datetime, Sub_metering_1, col="black"))
with(dt3, lines(datetime, Sub_metering_2, col="red"))
with(dt3, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
with(dt3, plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage"))
with(dt3, plot(datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global-reactive_power"))
dev.off()
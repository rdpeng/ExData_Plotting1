power <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
library(dplyr)
## LOAD DATE INTO A DATA FROM TABLE
power <- tbl_df(power)
power2 <- mutate(power,new_date=as.Date(Date,"%d/%m/%Y"))
power3 <- filter(power2,new_date>=as.Date("2/1/2007","%m/%d/%Y"),new_date<=as.Date("2/2/2007","%m/%d/%Y"))
rm(power,power2)

## PLOT 3
plot3 <- mutate(power3, time_date=paste(new_date,Time))
plot3 <- mutate(plot3, Sub_metering_1=as.numeric(as.character(Sub_metering_1)))
plot3 <- filter(plot3, !is.na(Sub_metering_1))
plot3 <- mutate(plot3, Sub_metering_2=as.numeric(as.character(Sub_metering_2)))
plot3 <- filter(plot3, !is.na(Sub_metering_2))
plot3 <- mutate(plot3, Sub_metering_3=as.numeric(as.character(Sub_metering_3)))
plot3 <- filter(plot3, !is.na(Sub_metering_3))
plot3 <- mutate(plot3, time_date2=as.POSIXct(strptime(time_date, "%Y-%m-%d %H:%M:%S")))

plot(plot3$time_date2, plot2$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering",
     cex.lab=0.75, cex.axis=0.75, ylim=c(0,38), yaxt="n")
ticks<-c(0,10,20,30)
axis(2, at=ticks, labels=ticks, cex.axis=0.75)
lines(plot3$time_date2, plot3$Sub_metering_1, type="l")
lines(plot3$time_date2, plot3$Sub_metering_2, type="l", col="red")
lines(plot3$time_date2, plot3$Sub_metering_3, type="l", col="blue")
legend("topright", pch="-", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2",
    "Sub_metering_3"), cex=0.5, lwd=1.5, lty=1)

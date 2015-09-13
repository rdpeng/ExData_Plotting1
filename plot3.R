setwd("~/rprog_data_ProgAssignment3-data/Exploratory")
library(ddplyr)
powerdata<- read.table("household_power_consumption.txt",sep=";",header = TRUE)

powerda <- transform(powerdata, Date = as.Date(Date,"%d/%m/%Y"))

powerda <- filter(powerda,Date>="2007-02-01" & Date <="2007-02-02")

DateTime = as.POSIXct(paste(powerda$Date, powerda$Time),"%d/%m/%Y %H:%M:%S")
Sub_metering_1 = as.numeric(as.character(powerda$Sub_metering_1))
Sub_metering_2 = as.numeric(as.character(powerda$Sub_metering_2))
Sub_metering_3 = as.numeric(as.character(powerda$Sub_metering_3))


suppressWarnings("Warning messages")
plot(DateTime,Sub_metering_1,main ="" ,
     xlab = "",ylab = "Energy sub metering",type = "l")

lines(DateTime,Sub_metering_2, col= "red")
lines(DateTime,Sub_metering_3, col= "blue")
legend("topright", col=c("black", "red", "blue"),
       legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3") ,
       lty=c(1,1), lwd=c(1,1))

# copy to png
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
par()
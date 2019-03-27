Sys.setlocale("LC_ALL","English")

df1 <- read.table("household_power_consumption.txt", dec=".",  sep = ";", na.strings = "?", 
                stringsAsFactors = F, header = T, colClasses = c("character", 
                "character", "numeric", "numeric", "numeric", "numeric", 
                "numeric", "numeric", "numeric" ))

df1$DT <- strptime(paste(df1$Date, df1$Time), format = "%d/%m/%Y %H:%M:%S")
df1 <- subset(df1, DT >= "2007-02-01" & DT < "2007-02-03")


png(filename = "Figure/Plot4.png")

par(mfrow = c(2,2))

#plot1

plot(x= df1$DT, y= df1$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab="")
lines(x= df1$DT, y= df1$Global_active_power, type = "l")

#plot2
plot(x= df1$DT, y= df1$Voltage,
     type = "n", ylab = "Voltage", xlab="" )
lines(x= df1$DT, y= df1$Voltage, type = "l")

#plot3
plot(x= df1$DT, y= df1$Sub_metering_1,
     type = "n", ylab = "Energy sub metering", xlab="" )
lines(x= df1$DT, y= df1$Sub_metering_1, type = "l")
lines(x= df1$DT, y= df1$Sub_metering_2, type = "l", col="red")
lines(x= df1$DT, y= df1$Sub_metering_3, type = "l", col="blue")
legend("topright", lwd = 3,pch = "-", col=c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       cex = 0.8, bty="n")

# plot4
plot(x= df1$DT, y= df1$Global_reactive_power,
     type = "n", ylab = "Global reactive power", xlab="" )
lines(x= df1$DT, y= df1$Global_reactive_power, type = "l")

dev.off()




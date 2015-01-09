

tabla <- read.csv(file="data/household_power_consumption.txt", 
                  header = TRUE, sep=";", na.strings = "?" )

fechaHora <- strptime(paste(tabla$Date, tabla$Time), format="%d/%m/%Y %H:%M:%S")
nueva=cbind(fechaHora,tabla)


subtabla <- subset(nueva, fechaHora >="2007-02-01" & fechaHora < "2007-02-03")

png(filename="plot4.png")

par(mfrow = c(2,2))

plot( x = subtabla$fechaHora, y=subtabla$Global_active_power, type = "l", xaxp=c(1,2880,2), xlab ="",
     ylab = "Global Active Power (kilowats)")


plot( x = subtabla$fechaHora, y=subtabla$Voltage, type = "l", xlab ="datetime",
     ylab = "Voltage")

plot( x = subtabla$fechaHora, y=subtabla$Sub_metering_1, type = "l", 
      col="black", xlab =" " , ylab = "Energy sub mettering")
points( x = subtabla$fechaHora, y=subtabla$Sub_metering_2, type = "l", col="red")
points( x = subtabla$fechaHora, y=subtabla$Sub_metering_3, type = "l", col="blue")
legend("topright", col = c("black","red","blue"), pch="-",
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

plot(x = subtabla$fechaHora, y=subtabla$Global_reactive_power, type = "l", xlab ="datetime",
     ylab = "Global_reactive_power")


dev.off()

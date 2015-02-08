# plot 2

tabla <- read.csv(file="data/household_power_consumption.txt", 
                  header = TRUE, sep=";", na.strings = "?" )

fechaHora <- strptime(paste(tabla$Date, tabla$Time), format="%d/%m/%Y %H:%M:%S")
nueva=cbind(fechaHora,tabla)


subtabla <- subset(nueva, fechaHora >="2007-02-01" & fechaHora < "2007-02-03")

par(mfrow = c(1,1))


png(filename="plot2.png")

plot(x = subtabla$fechaHora, y=subtabla$Global_active_power, type = "l", xaxp=c(1,2880,2), xlab ="",
     ylab = "Global Active Power (kilowats).")

dev.off()

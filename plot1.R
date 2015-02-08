# Plot 1

tabla <- read.csv(file="data/household_power_consumption.txt", 
                  header = TRUE, sep=";", na.strings = "?" )

fechaHora <- strptime(paste(tabla$Date, tabla$Time), format="%d/%m/%Y %H:%M:%S")
nueva=cbind(fechaHora,tabla)


subtabla <- subset(nueva, fechaHora >="2007-02-01" & fechaHora < "2007-02-03")

par(mfrow = c(1,1))

png(filename="plot1.png")

hist(subtabla$Global_active_power, col ="red", breaks = 12,
     xlab = "Global Active Power (kilowats)", main = "Global Active Power")

dev.off()


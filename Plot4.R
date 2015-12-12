temp <- tempfile()

download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)

colunas <- read.table(unz(temp, "household_power_consumption.txt"), nrows = 1, sep = ";", header = F)
colunas <- as.vector(as.matrix(colunas))

tabela <- read.table(unz(temp, "household_power_consumption.txt"), nrows = 2880, sep = ";", header = F, skip = 66637, col.names = colunas)

unlink(temp)

png(filename="plot4.png", width = 480, height = 480, units = "px")

par(mfrow=c(2,2),mar=c(4,4,2,1)) 

plot(strptime(paste(tabela$Date, tabela$Time), format="%d/%m/%Y %H:%M:%S"), tabela$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

plot(strptime(paste(tabela$Date, tabela$Time), format="%d/%m/%Y %H:%M:%S"), tabela$Voltage, type = "l", ylab = "Voltage", xlab = "date/time")

plot(strptime(paste(tabela$Date, tabela$Time), format="%d/%m/%Y %H:%M:%S"), tabela$Sub_metering_1, type = "l", xlab = "", ylab="Energy sub metering")

lines(strptime(paste(tabela$Date, tabela$Time), format="%d/%m/%Y %H:%M:%S"), tabela$Sub_metering_2, col="red")

lines(strptime(paste(tabela$Date, tabela$Time), format="%d/%m/%Y %H:%M:%S"), tabela$Sub_metering_3, col = "blue")

legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1,1,1), pt.cex = 1, cex=0.7)

plot(strptime(paste(tabela$Date, tabela$Time), format="%d/%m/%Y %H:%M:%S"), tabela$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "date/time")

dev.off()


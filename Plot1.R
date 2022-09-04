## leer los datos por el documento de .txt
dato <- read.table("household_power_consumption.txt", sep = ";", header = T)

## extraer los str datos y los convierte en las fechas
dato$Date <- as.Date(data$Date, format="%d/%m/%Y")

## extraer las informaciones sobre dos dias
dia2 <- dato[which(dato$Date %in% as.Date(c("2007-02-01", "2007-02-02")))] 

## transformacion del tipo
dia2$Global_active_power <- as.numeric(dia2$Global_active_power)

## exporta el dibujo
png(filename="plot1.png", width=480, height = 480 )
par(las=1)
# plotting
hist(dia2$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()

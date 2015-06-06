#This creates the Plot4
datos=read.csv('household_power_consumption.txt',header=T, sep=';') ##This reads the cvs file
datos$Datetime = paste(as.character(datos[,1]) , datos[,2])  ##Combines Date and Time in 1 column
datos[,1]=as.Date(datos$Date,'%d/%m/%Y') ##Change the attribute form text to Date
datos= subset(datos, Date == '2007-02-01' | Date == '2007-02-02') ##Subset for the required dates
datos[,3] = as.numeric(as.character(datos[,3])) ## Takes the Global Active Power's, and changes it to numbers
datos$fecha<-strptime(datos$Datetime, '%d/%m/%Y %H:%M') ##Get the right date type

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0)) ##Divide the device
with(datos, { ##this will plot the 4 graphics
  plot(y=datos$Global_active_power,x=datos$fecha, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(y=datos$Voltage,x=datos$fecha, type="l",
       ylab="Voltage (volt)", xlab="")
  plot(y=datos$Sub_metering_1,x=datos$fecha, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(y=datos$Sub_metering_2,x=datos$fecha,col='Red')
  lines(y=datos$Sub_metering_3,x=datos$fecha,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(y=datos$Global_reactive_power,x=datos$fecha, type="l",
       ylab="Global Rective Power (kilowatts)",xlab="")
})
dev.copy(png, file="plot4.png",width=480, height=480, units="px", pointsize=12, type="windows", antialias="none")##Copy to PNG
dev.off() ##Close the Device

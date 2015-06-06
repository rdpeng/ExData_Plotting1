#This creates the Plot3
datos=read.csv('household_power_consumption.txt',header=T, sep=';') ##This reads the cvs file
datos$Datetime = paste(as.character(datos[,1]) , datos[,2])  ##Combines Date and Time in 1 column
datos[,1]=as.Date(datos$Date,'%d/%m/%Y') ##Change the attribute form text to Date
datos= subset(datos, Date == '2007-02-01' | Date == '2007-02-02') ##Subset for the required dates
datos[,3] = as.numeric(as.character(datos[,3])) ## Takes the Global Active Power's, and changes it to numbers
datos$fecha<-strptime(datos$Datetime, '%d/%m/%Y %H:%M') ##Get the right date type
plot(y=datos$Sub_metering_1, x=datos$Fecha, type="l", ylab="Energy sub metering", xlab="")##Creates the plot for 1 item
lines(y=datos$Sub_metering_2, x=datos$Fecha, col="red") ##add a line to eh plot with item 2
lines(y=datos$Sub_metering_3, x=datos$Fecha, col="blue")##add a line to eh plot with item 3
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))##Set the legend
dev.copy(png, file="plot3.png",width=480, height=480, units="px", pointsize=12, type="windows", antialias="none")##Copy to PNG
dev.off() ##Close the Device

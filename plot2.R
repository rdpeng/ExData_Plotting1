#This creates the Plot2
datos=read.csv('household_power_consumption.txt',header=T, sep=';') ##This reads the cvs file
datos$Datetime = paste(as.character(datos[,1]) , datos[,2])  ##Combines Date and Time in 1 column
datos[,1]=as.Date(datos$Date,'%d/%m/%Y') ##Change the attribute form text to Date
datos= subset(datos, Date == '2007-02-01' | Date == '2007-02-02') ##Subset for the required dates
datos[,3] = as.numeric(as.character(datos[,3])) ## Takes the Global Active Power's, and changes it to numbers
datos$fecha<-strptime(datos$Datetime, '%d/%m/%Y %H:%M') ##Get the right date type
png("plot2.png") ##Open a new PNG device
plot(datos$fecha,datos$Global_active_power,ylab='Global Active Power (kilowatts)',xlab='',type='line') ##Create the plt
dev.off() #Close the device

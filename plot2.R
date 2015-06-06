datos=read.csv('household_power_consumption.txt',header=T, sep=';') # read the textfile which is formatted as a csv
datos$Datetime = paste(as.character(datos[,1]) , datos[,2])  # merge date and time into a single column (all string variables)
datos[,1]=as.Date(datos$Date,'%d/%m/%Y') # convert the Date column's datatype from string to date 
datos= subset(datos, Date == '2007-02-01' | Date == '2007-02-02') #select only the two required days
datos[,3] = as.numeric(as.character(datos[,3])) # convert the Global Active Power's datatype from text (interpreted as factors, hence the as.character) to numbers
datos$fecha<-strptime(datos$Datetime, '%d/%m/%Y %H:%M')
png("plot2.png")
plot(datos$fecha,datos$Global_active_power,ylab='Global Active Power (kilowatts)',xlab='',type='line')
dev.off()

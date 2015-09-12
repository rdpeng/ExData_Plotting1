system.time ( hpc <- read.csv.sql(file = "household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", header = TRUE, sep = ";") )
datetime<-as.POSIXct(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")
par(mfrow = c(1, 1))
##plot2
plot(datetime,hpc$Global_active_power,type="l",ylab="Global Active Power (kilowatts)")

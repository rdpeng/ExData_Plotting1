### Reading the data 

Sys.setlocale("LC_TIME", "en_US.UTF-8")  
### Necesary to work the date and time in English

lines.to.skip <- 66637
max.num.row.to.read <- 2880

Data <- read.table(file="household_power_consumption.txt", skip = lines.to.skip , nrows = max.num.row.to.read , sep = ";", header=FALSE, na.strings = "?")
names.data <- scan(file="household_power_consumption.txt",  nlines=1 , sep = ";", what="character", quiet = TRUE)
names(Data) <- names.data

Data$Date <- as.Date(Data$Date, "%d/%m/%Y")
Data$Time <- strptime(paste(Data$Date, Data$Time), "%Y-%m-%d %H:%M:%S", tz = "UTC" )   

### Making the graph 4

png(file="plot4.png", width = 480, height = 480 )

par(mfrow = c(2,2))

with(Data, plot(Time, Global_active_power, type="l", ylab="Global Active Power", xlab=""  ) ) 
with(Data, plot(Time, Voltage, type="l", ylab="Voltage", xlab="datetime"  ) ) 
with(Data, plot(Time, Sub_metering_1, type="l", ylab="Energy submetering", xlab="")  )
with(Data, points(Time, Data$Sub_metering_2, type="l", col="red" ))
with(Data, points(Time, Data$Sub_metering_3, type="l", col="blue" ))
legend("topright", lty = 1, bty = 'n', col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )
with(Data, plot(Time, Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime"  ) ) 

dev.off()

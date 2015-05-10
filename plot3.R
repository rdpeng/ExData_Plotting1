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

### Making the graph 3

png(file="plot3.png", width = 480, height = 480 )

with(Data, plot(Time, Sub_metering_1, type="l", ylab="Energy submetering", xlab="")  )
with(Data, points(Time, Data$Sub_metering_2, type="l", col="red" ))
with(Data, points(Time, Data$Sub_metering_3, type="l", col="blue" ))

legend("topright", lty = 1, bty='o', col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

dev.off()

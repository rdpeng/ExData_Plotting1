##data <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), nrows=10, header=T, quote="\"", sep=";")

##Reading data from zip file. Sep is ;. removing data having "?", which is treated as NA

data<- read.table(unz("exdata_data_household_power_consumption.zip","household_power_consumption.txt"), sep=";", header=T, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?")

### Making data set only for 2 days
data<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

### Making the date as YYYY-MM-DD. with 0's filled for single digits

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

###making the date as POSIX compliant
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

###opening a .png environment
png("plot4.png", width=480, height= 480)

### plotting the graph - plot4

### the plots will be created in 4 parts...topleft, topright, bottomleft, bottomright

par(mfrow=c(2,2))

###First
plot(data$DateTime, data$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="") 

###Second
plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")   

###Third
plot(data$DateTime, data$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("black", "red", "blue")) 

###Fourth
plot(data$DateTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")  

### closing the device
dev.off()
#Master code

if(!file.exists("Data_set.Rda"))
{
        # Read the file
        data <- read.table("household_power_consumption.txt", header = TRUE, sep=";" ) 
        data$Date_Time <-as.POSIXct(paste(data$Date,data$Time),
                                    format = "%d/%m/%Y %H:%M:%S")
        data$Date <-as.Date(data$Date, format = c("%d/%m/%Y"))
        
        # Using only dates between 2007-02-01 and 2007-02-02
        data <- data[data$Date >="2007-02-01" & data$Date<="2007-02-02",]
        
        data[,3] <- as.numeric(data[,3])
        data[,4] <- as.numeric(data[,4])
        data[,5] <- as.numeric(data[,5])
        data[,6] <- as.numeric(data[,6])
        data[,7] <- as.numeric(data[,7])
        data[,8] <- as.numeric(data[,8])
        data[,9] <- as.numeric(data[,9])
        
        save(data, file="Data_set.Rda")
} else {load("Data_set.Rda")}

if(!dir.exists("Pictures")){dir.create("Pictures")}


png(file="./Pictures/plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
#1,1
with(data, plot(Date_Time,Global_active_power, type = "l",
                ylab = "Global Active Power (kilowatts)", xlab=""))
#1,2
plot(data$Date_Time,data$Voltage, type ='l', xlab = 'datetime', ylab='Voltage')
#2,1
with(data, plot(Date_Time,Sub_metering_1, type = "l",ylab = "Energy submetering", xlab=""))
points(data$Date_Time,data$Sub_metering_2, type = "l", col='red')
points(data$Date_Time,data$Sub_metering_3, type = "l", col='blue')
legend("topright", pch="--", col=c("black","red","blue"), legend=c("Sub_metering_1",
                                                                   "Sub_metering_2",
                                                                   "Sub_metering_3"))
#2,2
plot(data$Date_Time,data$Global_reactive_power, type ='h', xlab = 'datetime', ylab='Global_reactive_power')

dev.off()
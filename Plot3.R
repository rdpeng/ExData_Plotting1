File_Path <- "c:/users/Mark/Documents/R/household_power_consumption.txt"
Power_Data <- read.table(File_Path, header = TRUE, sep = ";")

Power_Data$Date <- as.Date(Power_Data$Date, format = "%d/%m/%Y")

Power_Data$Time <- as.POSIXct(strptime(paste(Power_Data$Date, Power_Data$Time), "%Y-%m-%d %H:%M:%S"))

Power_Data_Subset <- subset(Power_Data, Power_Data$Date >"2007-01-31" & Power_Data$Date < "2007-02-03")

plot(as.numeric(Power_Data_Subset$Sub_metering_1), type = "l", xaxt = "n", xlab = "", ylab = "Energy Sub Metering")
lines(as.numeric(Power_Data_Subset$Sub_metering_2), col = "Red")
lines(as.numeric(Power_Data_Subset$Sub_metering_3), col = "Blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1), lwd = c(2.5,2.5,2.5), col = c("Black", "Red", "Blue"))

axis(1, at = c(0, 500, 1000, 1500, 2000, 2500, 3000), labels = c("Thu","","", "Fri","", "", "Sat"))
        
png("plot3.png", width = 480, height = 480, units = "px", res = 300)

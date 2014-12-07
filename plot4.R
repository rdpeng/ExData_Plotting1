#Script to generate the plot3
#setwd("directory where the txt is stored")


##Load the data, only the days "1/2/2007" and "2/2/2007"
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
df1 <- df[df$Date=="1/2/2007"|df$Date=="2/2/2007",]
df1$Sub_metering_1 <- as.numeric(as.character(df1$Sub_metering_1))
df1$Sub_metering_2 <- as.numeric(as.character(df1$Sub_metering_2))
df1$Sub_metering_3 <- as.numeric(as.character(df1$Sub_metering_3))
df1$Global_active_power <- as.numeric(as.character(df1$Global_active_power))
df1$Global_reactive_power <- as.numeric(as.character(df1$Global_reactive_power))
df1$Voltage <- as.numeric(as.character(df1$Voltage))
#set the date and the timein a POSIXct format
df1$Date <- as.Date(df1$Date, "%d/%m/%Y")
datetime <- paste(df1$Date, df1$Time, sep=" ")
datetime <- strptime(datetime, format="%Y-%m-%d %H:%M:%S")

#Plot the four graphs in the same image

png(file="plot4.png")
par(mfrow=c(2,2))
#Plot the global active power vs day of the week
plot(datetime,df1$Global_active_power, type = "l", xlab="", ylab= "Global active power")

#Plot the voltage vs day of the week
plot(datetime,df1$Voltage, type = "l", ylab="Voltage")

#Plot the different energy sub metering vs day of the week
plot(datetime,df1$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
lines(datetime, df1$Sub_metering_2, col="red")
lines(datetime, df1$Sub_metering_3, col="blue")
legend("topright", lty= 1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

#Plot the Global reactive power vs day of the week
plot(datetime,df1$Global_reactive_power, type = "l", ylab="Global_reactive_power")

dev.off()

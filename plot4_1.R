# Download a subset of house_water_consumption.txt
# Subset Dataframe by Date between 2007-02-01 (Thursday) and 2007-02-02 (Friday).

library(lubridate)
# Convert txt file to Dataframe
df <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", dec=".")

# Subset Dataframe by Date
df2 <- df[(df$Date == "1/2/2007" | df$Date == "2/2/2007"), ]

# Tranform Date and Time from character to date
df2$DateTime <- strptime(paste(df2$Date, df2$Time), format="%d/%m/%Y %H:%M:%S")

# SUB PLOTS 1,2,3 and 4
par(mfrow=c(2,2))

# SUB PLOT 1
# Plot "Day of the week" vs "Global_active_power"
df2$Global_active_power <- as.numeric(df2$Global_active_power)
plot(df2$DateTime , df2$Global_active_power, type = "l", xlab="", ylab="Global active power (kilowatts)")

# SUB PLOT 2
# Plot "DateTime" vs "Voltage"
plot(df2$DateTime , df2$Voltage, type = "l", xlab="",sub="datetime", ylab="Voltage")

# SUB PLOT 3
# Plot of "day of the week" vs "Sub mettering 1,2 and 3"
plot(df2$DateTime , df2$Sub_metering_1, type = "l", xlab="",sub="", ylab="Energy sub mettering")
lines(df2$DateTime, df2$Sub_metering_2, type = "l", col = 2)
lines(df2$DateTime, df2$Sub_metering_3, type = "l", col = 3)
# Add legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3" ),col=c("black","red", "blue"), lty=1, bty="n", cex=0.45)

# SUB PLOT 4
# Plot "DateTime" vs "Global_reactive_power"
plot(df2$DateTime , df2$Global_reactive_power, type = "l", xlab="",sub="datetime", ylab="Global_reactive_power")


# Copy to plot4_1.png
dev.copy(png,file="plot4_1.png")
dev.off()

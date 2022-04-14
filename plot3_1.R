# Download a subset of house_water_consumption.txt
# Subset Dataframe by Date between 2007-02-01 (Thursday) and 2007-02-02 (Friday).

library(lubridate)
# Convert txt file to Dataframe
df <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", dec=".")

# Subset Dataframe by Date
df2 <- df[(df$Date == "1/2/2007" | df$Date == "2/2/2007"), ]

# Tranform Date and Time from character to date
df2$DateTime <- strptime(paste(df2$Date, df2$Time), format="%d/%m/%Y %H:%M:%S")
summary(df2)

# PLOT 2
# Plot of "day of the week" vs "Sub mettering 1,2 and 3"
df2$Global_active_power <- as.numeric(as.character(df2$Global_active_power))
png(file = "plot3_1.png", width = 480, height = 480)

plot(df2$DateTime , df2$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(df2$DateTime, df2$Sub_metering_2, type = "l", col = 2)
lines(df2$DateTime, df2$Sub_metering_3, type = "l", col = 3)
# Add legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3" ),col=c("black","red", "blue"), lty=1, cex=0.8)

dev.off()

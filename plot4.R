### loading lubridate and dplyr packages
library("lubridate")
library("dplyr")

### reading the data
file = "household_power_consumption.txt"
df <- read.table(file, header = TRUE, sep = ";", na.strings = "?")

### subsetting the requested dates
dates <- c(ymd("2007-02-01"), ymd("2007-02-02"))
df_subset <- df %>% filter(is.element(dmy(Date),dates)) %>%
    mutate(Date = dmy(Date), Time = hms(Time))

png(file="plot4.png", width=480, height=480)    
par(mfcol = c(2, 2))

plot(df_subset$Global_active_power, type="l", xaxt = 'n', xlab = "", ylab="Global Active Power (kilowatts)")
tick_coord <- c(0,0.5,1) * length(df_subset$Global_active_power)
axis(1,at=tick_coord, labels=c("Thursday", "Friday", "Saturday"))

plot(df_subset$Sub_metering_1, type="l",xaxt = 'n', xlab = "", ylab="Energy sub metering")
points(df_subset$Sub_metering_2, type="l", col = "red")
points(df_subset$Sub_metering_3, type="l", col = "blue")
tick_coord <- c(0,0.5,1) * length(df_subset$Global_active_power)
axis(1,at=tick_coord, labels=c("Thursday", "Friday", "Saturday"))
legend(x=3000,y=27, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty = c(1, 1, 1),
       bg='n', cex = 0.75, bty='n', xjust = 1, yjust = 0, y.intersp = 1)


plot(df_subset$Voltage, type="l",xaxt = 'n', xlab="datetime", ylab="Voltage")
tick_coord <- c(0,0.5,1) * length(df_subset$Global_active_power)
axis(1,at=tick_coord, labels=c("Thursday", "Friday", "Saturday"))

plot(df_subset$Global_reactive_power, type="l",xaxt = 'n',
     xlab="datetime", ylab="Global_reactive_power")
tick_coord <- c(0,0.5,1) * length(df_subset$Global_active_power)
axis(1,at=tick_coord, labels=c("Thursday", "Friday", "Saturday"))

dev.off()
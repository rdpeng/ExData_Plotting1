library("lubridate")
library("dplyr")
file = "household_power_consumption.txt"
df <- read.table(file, header = TRUE, sep = ";", na.strings = "?")

dates <- c(ymd("2007-02-01"), ymd("2007-02-02"))
df_subset <- df %>% filter(is.element(dmy(Date),dates)) %>%
    mutate(Date = dmy(Date), Time = hms(Time))
    #mutate(DT = paste(Date, Time), DT = strptime(DT, format="%d/%m/%Y %H:%M:%S"))
    

hist(df_subset$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "red")


plot(df_subset$Global_active_power, type="l", xaxt = 'n', xlab="Day", ylab="Global Active Power (kilowatts)")
tick_coord <- c(0,0.5,1) * length(df_subset$Global_active_power)
axis(1,at=tick_coord, labels=c("Thursday", "Friday", "Saturday"))

plot(df_subset$Sub_metering_1, type="l",xaxt = 'n', xlab="Day", ylab="Energy sub metering")
points(df_subset$Sub_metering_2, type="l", col = "red")
points(df_subset$Sub_metering_3, type="l", col = "blue")
tick_coord <- c(0,0.5,1) * length(df_subset$Global_active_power)
axis(1,at=tick_coord, labels=c("Thursday", "Friday", "Saturday"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=c(1,1,1), lwd = c(2,2,2))


plot(df_subset$Voltage, type="l",xaxt = 'n', xlab="datetime", ylab="Voltage")
tick_coord <- c(0,0.5,1) * length(df_subset$Global_active_power)
axis(1,at=tick_coord, labels=c("Thursday", "Friday", "Saturday"))

plot(df_subset$Global_reactive_power, type="l",xaxt = 'n',
     xlab="datetime", ylab="Global_reactive_power")
tick_coord <- c(0,0.5,1) * length(df_subset$Global_active_power)
axis(1,at=tick_coord, labels=c("Thursday", "Friday", "Saturday"))

#%>% mutate(year = year(Date), month = month(Date), day=day(Date)) %>%
#    filter(year == 2007 & month == 2 & (day == 1 | day == 2))
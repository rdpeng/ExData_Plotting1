library(data.table)
df <- fread('household_power_consumption.txt',na.strings = c('','NA','NULL'))
df <- transform(df,
                Datetime = as.POSIXct(strptime(paste(Date,Time,sep = " "),"%d/%m/%Y %H:%M:%S")),
                Global_active_power = as.numeric(Global_active_power),
                Global_reactive_power = as.numeric(Global_reactive_power),
                Voltage = as.numeric(Voltage),
                Global_intensity = as.numeric(Global_intensity),
                Sub_metering_1 = as.numeric(Sub_metering_1),
                Sub_metering_2 = as.numeric(Sub_metering_2),
                Sub_metering_3 = as.numeric(Sub_metering_3))

df <- df[(df$Datetime >= "2007-02-01 00:00:00" 
          & df$Datetime < "2007-02-03 00:00:00"),]

df$Wkday <- as.factor(weekdays(df$Datetime))
df$Wkday = as.character.POSIXt(weekdays(df$Datetime))


png("plot4.png",width = 480,height = 480, units = "px")
par(mar = c(4,5,2,2),mfrow = c(2,2))
## Top left plot
plot(x = df$Datetime, y = df$Global_active_power,type = "l",
     ylab = "Global Active Power (kilowatts)",
     xaxs = 'r',
     xlab = '')
## Top right plot
plot(x = df$Datetime,y = df$Voltage,type = "l",
     xaxs = 'r', ylab = "Voltage",
     xlab = "datetime")
## Bottom left plot
plot(x = df$Datetime, y = df$Sub_metering_1,type = "l",
     col = "black",
     ylim = c(0,38),
     ylab = "Energy sub metering",
     xaxs = 'r',
     xlab = '')
lines(x = df$Datetime, y = df$Sub_metering_2,type = "l",
      xaxt = 'n',
      col = "red")
lines(x = df$Datetime, y = df$Sub_metering_3,type = "l",
      xaxt = 'n',
      col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1),col = c("black","red","blue"),box.col = "white")
## Bottom right plot
plot(x = df$Datetime, y = df$Global_reactive_power, type = 'l',
     ylab = "Global_reactive_power",
     xlab = "datetime",
     xaxs = 'r')
dev.off()

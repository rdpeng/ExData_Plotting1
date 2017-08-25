#Plot 4
library(dplyr)

dat = read.csv("mydata.csv")
dat = mutate(dat, date_time = paste(Date, Time) %>% 
                     strptime("%d/%m/%Y %X", tz = "America/Los_Angeles") %>%
                     as.POSIXct
)
dat = select(dat, date_time, Global_active_power:Sub_metering_3)

png("plot4.png", width = 480, height = 480)
par(mfcol = c(2, 2))
# plot top left
plot(dat$date_time, dat$Global_active_power, type = "l",
     ylab = "Global Active Power", xlab = "")
# plot bottom left
plot(dat$date_time, dat$Sub_metering_1, type = "l",
     ylab = "Energy sub metering", xlab = "")
lines(dat$date_time, dat$Sub_metering_2, col = "red")
lines(dat$date_time, dat$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n", cex = 0.75)
# plot top right
plot(dat$date_time, dat$Voltage, xlab = "datetime", ylab = "Voltage",
     type = "l")
# plot bottom right
plot(dat$date_time, dat$Global_reactive_power, 
     xlab = "datetime", ylab = "Global_reactive_power",
     type = "l")
dev.off()

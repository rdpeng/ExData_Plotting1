#Plot 3
library(dplyr)

dat = read.csv("mydata.csv")
dat = mutate(dat, date_time = paste(Date, Time) %>% 
                     strptime("%d/%m/%Y %X", tz = "America/Los_Angeles") %>%
                     as.POSIXct
)
dat = select(dat, date_time, Global_active_power:Sub_metering_3)

png("plot3.png", width = 480, height = 480)
plot(dat$date_time, dat$Sub_metering_1, type = "l",
     ylab = "Energy sub metering", xlab = "")
lines(dat$date_time, dat$Sub_metering_2, col = "red")
lines(dat$date_time, dat$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

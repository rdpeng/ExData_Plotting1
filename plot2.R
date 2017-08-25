#Plot 2
library(dplyr)

dat = read.csv("mydata.csv")
dat = mutate(dat, date_time = paste(Date, Time) %>% 
                     strptime("%d/%m/%Y %X", tz = "America/Los_Angeles") %>%
                     as.POSIXct
)
dat = select(dat, date_time, Global_active_power:Sub_metering_3)

png("plot2.png", width = 480, height = 480)
plot(dat$date_time, dat$Global_active_power, type = "l",
        ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()

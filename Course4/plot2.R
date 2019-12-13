getwd()
setwd("./Course4")

twoday_power <- read.csv(file = "Feb2DayPower.csv")


library(dplyr)
library(lubridate)
# day1 <- twoday_power %>% 
#   filter(Date == "1/2/2007") %>% 
#   mutate(DayHour = hms(Time)) %>% 
#   mutate(DayHour =DayHour)
# day2 <- twoday_power %>% 
#   filter(Date == "2/2/2007") %>% 
#   mutate(DayHour = hms(Time)) %>% 
#   mutate(DayHour =DayHour + hours(24))
# DayHour_Power <- rbind(day1,day2)
#made this a bit complicated...

DayHour = strptime(paste(twoday_power$Date,twoday_power$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
ActivePower = DayHour_Power$Global_active_power
png("plot2.png", width=480, height=480)

plot(DayHour, ActivePower,type = "l", xlab="", ylab = "Global Active Power (kilowatts)")
dev.off()





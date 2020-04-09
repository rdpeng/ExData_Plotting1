library(dplyr)
library(tidyr)
power <- read.csv(file = "power.txt",sep = ";", stringsAsFactors = F)
power_date <- power %>% mutate(Date = as.Date(Date, format = "%d/%m/%Y"))
power_date_target <- power_date %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02")  
power_date_target$Day <- as.POSIXct(paste(power_date_target$Date, power_date_target$Time))
power_date_target[3:8] <- sapply(power_date_target[3:8],as.numeric)
power_date_target_gather <- pivot_longer(data = power_date_target, names_to = "id",values_to = "value",7:9)

png(filename = "plot4.png",width = 480, height = 480)

par(mfrow = c(2,2))

########### Generating Global Active power graph
with(power_date_target, plot(Day, Global_active_power, 
                             type = "l",
                             xlab = "", 
                             ylab = "Global Active Power"))

########### Generating Voltage graph
with(power_date_target, plot(Day, Voltage,
                             type = "l",
                             xlab = "datetime",
                             ylab = "Voltage"))
                             

########### Generating Energy Sub metering graph
sm1 <- filter(power_date_target_gather, id == "Sub_metering_1")
sm2 <- filter(power_date_target_gather, id == "Sub_metering_2")
sm3 <- filter(power_date_target_gather, id == "Sub_metering_3")

with(sm1, plot(Day,value,type = "l",lty=1,col="black",xlab = "", ylab = "Energy Sub metering"))
with(sm2, lines(Day,value,type = "l",lty=1,col="red"))
with(sm3, lines(Day,value,type = "l",lty=1,col="blue"))
legend("topright",
       lty = c(1,1,1),
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       cex = 1)

########### Generating Global Reactive power graph
with(power_date_target, plot(Day, Global_reactive_power,
                             type = "l",
                             xlab = "datetime",
                             ylab = "Global_reactive_power"))
                             

dev.off()

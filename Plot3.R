pwr <- read.csv("../household_power_consumption.txt", sep=";",
                colClasses = c("character"
                               ,"character"
                               ,"numeric"
                               ,"numeric"
                               ,"numeric"
                               ,"numeric"
                               ,"numeric"
                               ,"numeric"
                               ,"numeric")
               ,na.strings='?')
p1 <- pwr[as.Date(pwr$Date, format = "%d/%m/%Y") == "2007-02-01",]
p2 <- pwr[as.Date(pwr$Date, format = "%d/%m/%Y") == "2007-02-02",]
p <- rbind(p1, p2)
dt <- paste(p$Date, p$Time)
dt <- strptime(dt, format = "%d/%m/%Y %H:%M:%S")
png(file = "plot3.png", width = 480, height = 480)
plot(p[,7], type = "l"
     , xaxt = "n"
     , xlab = ""
     , ylab = "Energy sub metering")
lines(p[,8], col = "red")
lines(p[,9], col = "blue")
days <- c("Thu","Fri","Sat")
legend("topright"
       , legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       , col = c("black","red","blue")
       , lwd = 1)
axis(1,at=c(1,1440,2880),labels=days)
dev.off()

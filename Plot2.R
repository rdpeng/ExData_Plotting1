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
png(file = "plot2.png", width = 480, height = 480)
plot(p[,3], type = "l"
     , xaxt = "n"
     , xlab = ""
     , ylab = "Global Active Power (kilowatts)")
days <- c("Thu","Fri","Sat")
axis(1,at=c(1,1440,2880),labels=days)
dev.off()

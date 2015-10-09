dat <- read.table("household_power_consumption.txt", sep=";", header = T,na.strings="?" )

dat$Date <- as.character(paste(dat$Date))
dat$Time <- as.character(paste(dat$Time))

mydat <- dat[dat$Date %in% c("1/2/2007","2/2/2007"),]

dt <- paste(mydat$Date, mydat$Time)
dt <- strptime(dt, format="%d/%m/%Y %H:%M:%S")

mydat$DT <- dt

png(file="plot3.png", wid=480, height = 480, units = "px")

with(mydat, plot(DT,Global_active_power, type="n",
                 xlab="", ylab="Energy sub metering",
                 ylim=c(0,38)
))

with(mydat, lines(DT, Sub_metering_1))
with(mydat, lines(DT, Sub_metering_2, col="red"))
with(mydat, lines(DT, Sub_metering_3, col="blue"))

legend("topright", lty = 1, 
       col=c("black", "red", "blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()




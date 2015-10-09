dat <- read.table("household_power_consumption.txt", sep=";", header = T,na.strings="?" )

dat$Date <- as.character(paste(dat$Date))
dat$Time <- as.character(paste(dat$Time))

mydat <- dat[dat$Date %in% c("1/2/2007","2/2/2007"),]

dt <- paste(mydat$Date, mydat$Time)
dt <- strptime(dt, format="%d/%m/%Y %H:%M:%S")

mydat$DT <- dt

png(file="plot1.png", wid=480, height = 480, units = "px")
hist(mydat$Global_active_power, col="red",
     main ="Global Active Power",
     xlab="Global Active Power (kilowatts)" )
dev.off()




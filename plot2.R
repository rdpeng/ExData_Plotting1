pwr <- read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
pwr$Date <- as.Date(pwr$Date,"%d/%m/%Y")
#pwr$Time <- NULL
days <- subset(pwr,pwr$Date >= "2007-02-01" & pwr$Date <= "2007-02-02")
days$Time <- as.POSIXct(strptime(paste(days$Date, days$Time), "%Y-%m-%d %H:%M:%S"))
row.names(days) <- NULL

with(days, plot(Time,Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)"))

## Copy plot to a PNG file
dev.copy(png, file = "plot2.png", height=480, width=480, units="px")
dev.off()
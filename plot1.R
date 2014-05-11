pwr <- read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
pwr$Date <- as.Date(pwr$Date,"%d/%m/%Y")
pwr$Time <- NULL
days <- subset(pwr,pwr$Date >= "2007-02-01" & pwr$Date <= "2007-02-02")
row.names(days) <- NULL

with(days, hist(Global_active_power,col="red",main = "Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency"))

## Copy plot to a PNG file
dev.copy(png, file = "plot1.png", height=480, width=480, units="px")
dev.off()
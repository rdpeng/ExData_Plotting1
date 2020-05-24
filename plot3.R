hpc="household_power_consumption.txt"


colNames = c("date", "time", "globalActivePower", "globalReactivePower", "voltage", "globalIntensity", "subMetering1", "subMetering2", "subMetering3")
colClasses = c("character", "character", rep("numeric",7) )


d1f <- read.table(hpc, header=TRUE, sep=";", col.names=colNames, colClasses=colClasses, na.strings="?")


df1$date = as.Date(df1$date, format="%d/%m/%Y")
df1 = df1[df1$date >= as.Date("2007-02-01") & df1$date<=as.Date("2007-02-02"),]

png(filename="plott3.png", width=480, height=480, units="px")
with(df1, {
  plot(subMetering1,type="l", xaxt="n", xlab="", ylab="Energy sub metering")
  lines(x=subMetering2, col="red")
  lines(x=subMetering3, col="blue")
})
axis(1, at=c(1, as.integer(nrow(df1)/2), nrow(df1)), labels=c("Thu", "Fri", "Sat"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

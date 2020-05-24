hpc = "household_power_consumption.txt"

colNames = c("date", "time", "globalActivePower", "globalReactivePower", "voltage", "globalIntensity", "subMetering1", "subMetering2", "subMetering3")
colClasses = c("character", "character", rep("numeric",7) )

df1 =read.table(hpc, header=TRUE, sep=";", col.names=colNames, colClasses=colClasses, na.strings="?")

df1$date = as.Date(df1$date, format="%d/%m/%Y")
df1 = df1[df1$date >= as.Date("2007-02-01") & df1$date<=as.Date("2007-02-02"),]


png(filename="plott1.png", width=480, height=480, units="px")
hist(df1$globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

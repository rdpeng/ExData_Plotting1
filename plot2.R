
hpc= "household_power_consumption.txt"


colNames = c("date", "time", "globalActivePower", "globalReactivePower", "voltage", "globalIntensity", "subMetering1", "subMetering2", "subMetering3")
colClasses = c("character", "character", rep("numeric",7) )


df1 <- read.table(hpc, header=TRUE, sep=";", col.names=colNames, colClasses=colClasses, na.strings="?")

#convert to Date type, then filter
df1$date = as.Date(df1$date, format="%d/%m/%Y")
df1 = df1[df1$date >= as.Date("2007-02-01") & df1$date<=as.Date("2007-02-02"),]

#plot and save graph
png(filename="plott2.png", width=480, height=480, units="px")
plot(df1$globalActivePower, type="l",xaxt="n",xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at=c(1, as.integer(nrow(df)/2), nrow(df)), labels=c("Thu", "Fri", "Sat"))
dev.off()

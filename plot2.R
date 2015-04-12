#assume the database file located at working directory

#file name
fn <- "household_power_consumption.txt"

#column names
colNames = c("date", "time", "globalActivePower", "globalReactivePower", "voltage", "globalIntensity", "subMetering1", "subMetering2", "subMetering3")
colClasses = c("character", "character", rep("numeric",7) )

#read file
df <- read.table(fn, header=TRUE, sep=";", col.names=colNames, colClasses=colClasses, na.strings="?")

#convert to Date type, then filter
df$date = as.Date(df$date, format="%d/%m/%Y")
df = df[df$date >= as.Date("2007-02-01") & df$date<=as.Date("2007-02-02"),]

#plot and save graph
png(filename="plot2.png", width=480, height=480, units="px")
plot(df$globalActivePower, type="l",xaxt="n",xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at=c(1, as.integer(nrow(df)/2), nrow(df)), labels=c("Thu", "Fri", "Sat"))
dev.off()

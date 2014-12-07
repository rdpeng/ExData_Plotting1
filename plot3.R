#Script to generate the plot3
#setwd("directory where the txt is stored")


##Load the data, only the days "1/2/2007" and "2/2/2007"
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
df1 <- df[df$Date=="1/2/2007"|df$Date=="2/2/2007",]
df1$Sub_metering_1 <- as.numeric(as.character(df1$Sub_metering_1))
df1$Sub_metering_2 <- as.numeric(as.character(df1$Sub_metering_2))
df1$Sub_metering_3 <- as.numeric(as.character(df1$Sub_metering_3))
#set the date and the timein a POSIXct format
df1$Date <- as.Date(df1$Date, "%d/%m/%Y")
datetime <- paste(df1$Date, df1$Time, sep=" ")
datetime <- strptime(datetime, format="%Y-%m-%d %H:%M:%S")

#Plot the different energy sub metering vs day of the week
png(file="plot3.png")
plot(datetime,df1$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
lines(datetime, df1$Sub_metering_2, col="red")
lines(datetime, df1$Sub_metering_3, col="blue")
legend("topright", lty= 1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

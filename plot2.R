#Script to generate the plot2
#setwd("directory where the txt is stored")


##Load the data, only the days "1/2/2007" and "2/2/2007"
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
df1 <- df[df$Date=="1/2/2007"|df$Date=="2/2/2007",]
df1$Global_active_power <- as.numeric(as.character(df1$Global_active_power))

#set the date and the timein a POSIXct format
df1$Date <- as.Date(df1$Date, "%d/%m/%Y")
datetime <- paste(df1$Date, df1$Time, sep=" ")
datetime <- strptime(datetime, format="%Y-%m-%d %H:%M:%S")

#Plot the global active power vs day of the week
png(file="plot2.png")
plot(datetime,df1$Global_active_power, type = "l", xlab="", ylab="Global active power (kilowatts)")
dev.off()

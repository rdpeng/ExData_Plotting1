my_data <- read.table(file="household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

#date <- my_data$Date
#time <- my_data$Time
x <- paste(my_data$Date,my_data$Time)
x1 <- strptime(x,"%d/%m/%Y %H:%M:%S")

x1 <- as.POSIXct(x1)

xmin <- as.POSIXct("2007-01-31 23:59:59")
xmax <- as.POSIXct("2007-02-03 00:00:00")
my_new <- cbind(x1,my_data)
z <- subset(my_new,x1>xmin & x1<xmax,select= Global_active_power)

png("plot1.png",width=8, height=8, units="in", res=300)
par(mfrow = c(1,1))
hist(z$Global_active_power,col="red",main="Global Active Power", font.main = 2,xlab="Global Active Power (kilowatts)")
dev.off()
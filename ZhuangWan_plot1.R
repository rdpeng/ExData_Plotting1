
data = read.table("household_power_consumption.txt",header=T, sep=";")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
sub <- subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02" ) # using data from the dates 2007-02-01 and 2007-02-02


power <- as.numeric(as.character(one$Global_active_power)) # convert factor to numeric
times <- as.character(sub$Time)
x <- paste(sub$Date, times)
x1 <- strptime(x, "%Y-%m-%d %H:%M:%S")
one <- data.frame(x1,power)
png("plot2.png", width = 480, height = 480, units = "px")
with(one,plot(x1,power,type="l",ylab="Global Active Power(kilowatts)",xlab=''))
dev.off()



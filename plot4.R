##Project1

##reading household_power_consumption.txt
x <- read.table("./household_power_consumption.txt", sep=";", header=TRUE)
head(x,3)
names(x)[1:9]

##subsetting data from the dates 2007-02-01 and 2007-02-02
y<-x[(x$Date=="1/2/2007"| x$Date=="2/2/2007"),]
head(y,3)
names(y)[1:9]

##create plot4
png(file = "plot4.png",width=480, height=480) ## Open PNG device

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
##graph1
z <-transform(y, Time2=strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"))
z$a <-as.numeric(levels(y$Global_active_power))[y$Global_active_power] ##convert to numeric variable
head(z, 3)

with(z, plot(Time2, a, ylab="Global Active Power (kilowatts)", xlab = "", pch = 46))
with(z, lines(Time2,a))

##graph2
z <-transform(y, Time2=strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"))
z$b <-as.numeric(levels(y$Voltage))[y$Voltage] ##convert to numeric variable
head(z, 3)

with(z, plot(Time2, b, ylab="Voltage", xlab = "datetime", pch = 46))
with(z, lines(Time2,b))


##graph3
z <-transform(y, Time2=strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"))
z$sm1 <-as.numeric(levels(y$Sub_metering_1))[y$Sub_metering_1] ##convert to numeric variable
z$sm2 <-as.numeric(levels(y$Sub_metering_2))[y$Sub_metering_2] ##convert to numeric variable
head(z, 3)

with(z, plot(Time2, sm1, ylab="Energy sub metering ", xlab = "", pch = 46))
with(z, lines(Time2, sm1))
with(z, lines(Time2, sm2, col="red"))
with(z, lines(Time2, Sub_metering_3, col="blue"))
legend("topright", lty =1, col = c("black","blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),bty = "n")

##graph4
z <-transform(y, Time2=strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"))
z$c <-as.numeric(levels(y$Global_reactive_power))[y$Global_reactive_power] ##convert to numeric variable
head(z, 3)

with(z, plot(Time2, c, ylab="Global_active_power", xlab = "datetime", pch = 46))
with(z, lines(Time2,c))

dev.off() ## Close the PNG file device

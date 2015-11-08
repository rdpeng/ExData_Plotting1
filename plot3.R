##Project1

##reading household_power_consumption.txt
x <- read.table("./household_power_consumption.txt", sep=";", header=TRUE)
head(x,3)
names(x)[1:9]

##subsetting data from the dates 2007-02-01 and 2007-02-02
y<-x[(x$Date=="1/2/2007"| x$Date=="2/2/2007"),]
head(y,3)
names(y)[1:9]


##create plot3
png(file = "plot3.png",width=480, height=480) ## Open PNG device

z <-transform(y, Time2=strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"))
z$sm1 <-as.numeric(levels(y$Sub_metering_1))[y$Sub_metering_1] ##convert to numeric variable
z$sm2 <-as.numeric(levels(y$Sub_metering_2))[y$Sub_metering_2] ##convert to numeric variable
head(z, 3)

with(z, plot(Time2, sm1, ylab="Energy sub metering ", xlab = "", pch = 46))
with(z, lines(Time2, sm1))
with(z, lines(Time2, sm2, col="red"))
with(z, lines(Time2, Sub_metering_3, col="blue"))
legend("topright", lty =1, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))



dev.off() ## Close the PNG file device
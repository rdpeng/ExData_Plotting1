##Project1

##reading household_power_consumption.txt
x <- read.table("./household_power_consumption.txt", sep=";", header=TRUE)
head(x,3)
names(x)[1:9]

##subsetting data from the dates 2007-02-01 and 2007-02-02
y<-x[(x$Date=="1/2/2007"| x$Date=="2/2/2007"),]
head(y,3)
names(y)[1:9]

##create plot2
png(file = "plot2.png",width=480, height=480) ## Open PNG device

z <-transform(y, Time2=strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"))
z$GAP2 <-as.numeric(levels(y$Global_active_power))[y$Global_active_power] ##convert to numeric variable
head(z, 3)

with(z, plot(Time2, z$GAP2, ylab="Global Active Power (kilowatts)", xlab = "", pch = 46))
with(z, lines(Time2,z$GAP2))


dev.off() ## Close the PNG file device
##Project1

##reading household_power_consumption.txt
x <- read.table("./household_power_consumption.txt", sep=";", header=TRUE)
head(x,3)
names(x)[1:9]

##subsetting data from the dates 2007-02-01 and 2007-02-02
y<-x[(x$Date=="1/2/2007"| x$Date=="2/2/2007"),]
head(y,3)
names(y)[1:9]

##create plot1
png(file = "plot1.png",width=480, height=480) ## Open PNG device
class(y$Global_active_power)
y$GAP <-as.numeric(levels(y$Global_active_power))[y$Global_active_power] ##convert to numeric variable
hist(y$GAP, col = "red",main = "Global Active Power",xlab ="Global Active Power (kilowatts)")

dev.off() ## Close the PNG file device
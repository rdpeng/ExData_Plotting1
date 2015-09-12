## Plot the four views of readings from UCI data
## Plot 4 for course project 1 for courera subject exdata-032
## setwd("~/Documents/uni/courserarprog/exploratory")

# read in the UCI data and subset to first two days in February
filename="household_power_consumption.txt"
newdata <- read.table(filename,sep=";",header=TRUE,na.strings="?",stringsAsFactors=FALSE)
newdata[,"Date"] <- as.Date(newdata[,"Date"],format= "%d/%m/%Y")
newdata<-newdata[newdata$Date=="2007-02-02"|newdata$Date=="2007-02-01",]

# add a new column of the date in POSIXct format
newdata<-cbind(as.POSIXct(strptime(paste(newdata[,1],newdata[,2]),format="%Y-%m-%d %H:%M:%S")), newdata)
names(newdata)[1]<-"ctTime"

# create four graphs to explore the readings, as a png file
pngname="plot4.png"
png(filename=pngname,width=480, height=480)
par(mfrow=c(2,2))

# First graph of global active power
Power.name <- "Global Active Power"
plot(newdata$ctTime,newdata$Global_active_power,type="l",ylab=Power.name,xlab="")

# Second graph of voltage
Power.name <- "Voltage"
Date.name <- "datetime"
plot(newdata$ctTime,newdata$Voltage,type="l",ylab=Power.name,xlab=Date.name )

# Third graph of enegery submetering
Power.name <- "Energy sub metering"
plot(newdata$ctTime,newdata$Sub_metering_1,type="l",ylab=Power.name,xlab="")
lines(newdata$ctTime,newdata$Sub_metering_2,type="l",ylab=Power.name,xlab="",col="Red")
lines(newdata$ctTime,newdata$Sub_metering_3,type="l",ylab=Power.name,xlab="",col="Blue")
legend("topright",lty=1,lwd=1,cex=.9,bty="n",col=c("black","blue","red"),legend=names(newdata[,8:10]))

# Fourth graph of global reactive power
Power.name <- "Global_reactive_power"
plot(newdata$ctTime,newdata$Global_reactive_power,type="l",ylab=Power.name,xlab=Date.name )

dev.off()


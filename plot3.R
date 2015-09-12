## Plot the three energy sub metering readings from UCI data
## Plot 3 for course project 1 for courera subject exdata-032
## setwd("~/Documents/uni/courserarprog/exploratory")

# read in the UCI data and subset to first two days in February
filename="household_power_consumption.txt"
newdata <- read.table(filename,sep=";",header=TRUE,na.strings="?",stringsAsFactors=FALSE)
newdata[,"Date"] <- as.Date(newdata[,"Date"],format= "%d/%m/%Y")
newdata<-newdata[newdata$Date=="2007-02-02"|newdata$Date=="2007-02-01",]

# add a new column of the date in POSIXct format
newdata<-cbind(as.POSIXct(strptime(paste(newdata[,1],newdata[,2]),format="%Y-%m-%d %H:%M:%S")), newdata)
names(newdata)[1]<-"ctTime"

# create a line graph of the three sub metering readings into a png file
pngname="plot3.png"
png(filename=pngname,width=480, height=480)
Power.name <- "Energy sub metering"
plot(newdata$ctTime,newdata$Sub_metering_1,type="l",ylab=Power.name,xlab="")
lines(newdata$ctTime,newdata$Sub_metering_2,type="l",ylab=Power.name,xlab="",col="Red")
lines(newdata$ctTime,newdata$Sub_metering_3,type="l",ylab=Power.name,xlab="",col="Blue")
legend("topright",lty=1,lwd=1,cex=.9,col=c("black","blue","red"),legend=names(newdata[,8:10]))
dev.off()


## setwd("~/Documents/uni/courserarprog/exploratory")

filename="household_power_consumption.txt"

newdata <- read.table(filename,sep=";",header=TRUE,na.strings="?",stringsAsFactors=FALSE)
newdata[,"Date"] <- as.Date(newdata[,"Date"],format= "%d/%m/%Y")
newdata<-newdata[newdata$Date=="2007-02-02"|newdata$Date=="2007-02-01",]

newdata<-cbind(as.POSIXct(strptime(paste(newdata[,1],newdata[,2]),format="%Y-%m-%d %H:%M:%S")), newdata)
names(newdata)[1]<-"ctTime"

# weekdays(newdata[,"ctTime"])

pngname="plot2.png"
png(filename=pngname,width=480, height=480)
Power.name <- "Global Active Power (kilowatts)"
plot(newdata$ctTime,newdata$Global_active_power,type="l",ylab=Power.name,xlab="")
dev.off()


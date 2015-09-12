## Plot Global Active Power from UCI data
## Plot 1 for course project 1 for courera subject exdata-032
## setwd("~/Documents/uni/courserarprog/exploratory")

filename="household_power_consumption.txt"

# read in the UCI data and subset to first two days in February
newdata <- read.table(filename,sep=";",header=TRUE,na.strings="?",stringsAsFactors=FALSE)
newdata[,"Date"] <- as.Date(newdata[,"Date"],format= "%d/%m/%Y")
newdata<-newdata[newdata$Date=="2007-02-02"|newdata$Date=="2007-02-01",]

# add a new column of the date in POSIXct format
newdata<-cbind(as.POSIXct(strptime(paste(newdata[,1],newdata[,2]),format="%Y-%m-%d %H:%M:%S")), newdata)
names(newdata)[1]<-"ctTime"

# create a graph of global active power, as a png file
pngname="plot1.png"
# png(filename=pngname,width=480, height=480)
Power.name <- "Global Active Power (kilowatts)"
Graph.name <- "Global Active Power"
hist(newdata$Global_active_power,col="Red",xlab=Power.name,main=Graph.name)
dev.off()


## Plot Global Active Power from UCI data
## Plot 1 for course project 1 for courera subject exdata-032
## setwd("~/Documents/uni/courserarprog/exploratory")

filename="household_power_consumption.txt"

## start reading from the first date "2007-02-01"
## this was calculated using
## nrow(newdata[newdata$Date < "2007-02-01",])
## skiprows = 66636
## read the nbr of rows to the last entry for 2007-02-02
## this was calculated using
## nrow(newdata[newdata$Date=="2007-02-02"|newdata$Date=="2007-02-01",])
# nbrrows = 2880
# newdata <- read.table(filename,sep=";",header=TRUE,na.strings="?",nrows = nbrrows, skip=skiprows,stringsAsFactors=FALSE)

newdata <- read.table(filename,sep=";",header=TRUE,na.strings="?",stringsAsFactors=FALSE)
newdata[,"Date"] <- as.Date(newdata[,"Date"],format= "%d/%m/%Y")
newdata<-newdata[newdata$Date=="2007-02-02"|newdata$Date=="2007-02-01",]

newdata<-cbind(as.POSIXct(strptime(paste(newdata[,1],newdata[,2]),format="%Y-%m-%d %H:%M:%S")), newdata)
names(newdata)[1]<-"ctTime"

pngname="plot1.png"
# png(filename=pngname,width=480, height=480)
Power.name <- "Global Active Power (kilowatts)"
Graph.name <- "Global Active Power"
hist(newdata$Global_active_power,col="Red",xlab=Power.name,main=Graph.name)
dev.off()


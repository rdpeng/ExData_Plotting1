# download and unzip file
Url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(Url,destfile="./elecP.zip", method="curl")
unzip(zipfile ="elecP.zip")
# load file into R as elecP
elecP<-read.table("household_power_consumption.txt",sep=";", header=TRUE, na.strings="?", stringsAsFactors = FALSE)
# change Date variables into Date class, and subset data from the dates 2007-02-01 and 2007-02-02
library(lubridate)
elecP$Date<-dmy(elecP$Date)
elecP_sub <- subset(elecP, Date >= ymd("2007-02-01") & Date <= ymd("2007-02-02") )
# plot1
hist(elecP_sub$Global_active_power,xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power", col="Red")
# copy plot1 to png device, named as "plot1.png"
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()

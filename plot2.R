setwd("/Users/nanjals/Desktop/DataScience/datasciencecoursera")
getwd()

householddata<-read.csv("household_power_consumption.txt", header = T, sep=';',
                        stringsAsFactors=FALSE, comment.char="", quote='\"', na.strings="?"
                        ,check.names=F, nrows=2075259)
powerdata<-subset(householddata, Date %in% c("1/2/2007","2/2/2007"))
powerdata$Date<-as.Date(powerdata$Date,format="%d/%m/%y")
datetime <- paste(as.Date(powerdata$Date), powerdata$Time)
powerdata$Datetime <- as.POSIXct(datetime)
with(powerdata, {
       plot(Global_active_power~Datetime, type="l",
                    ylab="Global Active Power (kilowatts)", xlab="")
 })

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
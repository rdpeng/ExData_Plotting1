setwd("/Users/nanjals/Desktop/DataScience/datasciencecoursera")
getwd()

householddata<-read.csv("household_power_consumption.txt", header = T, sep=';',
    stringsAsFactors=FALSE, comment.char="", quote='\"', na.strings="?"
    ,check.names=F, nrows=2075259)

powerdata<-subset(householddata, Date %in% c("1/2/2007","2/2/2007"))
powerdata$Date<-as.Date(powerdata$Date,format="%d/%m/%y")
hist(powerdata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
png("plot1.png", width=480, height=480)
dev.off()
urldr<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(urldr,"household_power_consumption.zip")
unzip("household_power_consumption.zip")
dataEAPA<-read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE,dec=".")
datEA<-dataEAPA[dataEAPA$Date %in% c("1/2/2007","2/2/2007"),]
head(datEA)
GAP<-as.numeric(datEA$Global_active_power)
png("Plot1.png",width=480,height=480)
hist(GAP,main="Global Active Power", xlab="Global Active Power (kilowatts)",col="red")
dev.off()

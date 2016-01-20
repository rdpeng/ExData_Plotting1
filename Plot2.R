urldr<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(urldr,"household_power_consumption.zip")
unzip("household_power_consumption.zip")
dataEAPA<-read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE,dec=".")
datEA<-dataEAPA[dataEAPA$Date %in% c("1/2/2007","2/2/2007"),]
head(datEA)
GAP<-as.numeric(datEA$Global_acti)
Fechas<-as.POSIXct(paste(datEA$Date,datEA$Time,sep=""), format="%d/%m/%Y %H:%M:%S")
png("Plot2.png",width=480,height=480)
plot(Fechas,GAP,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()

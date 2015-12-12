#Install chron package if required
##install.packages("chron")
##library("chron")

#Clear environment variables
rm(list=ls())

#Read data and subset
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subdata<- subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007", select=Date:Sub_metering_3)
GAP <- as.numeric(subdata$Global_active_power)

#Select graphics output
png("plot2.png", width=480, height=480)

#read date  in format %a abbreviated day name
as.Date(subdata$Date)
x=paste(subdata$Date, subdata$Time, sep=" ")
x=strptime(x, "%d/%m/%Y %H:%M:%S") 

#Plot
png("plot2.png", width=480, height=480)
plot(x, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
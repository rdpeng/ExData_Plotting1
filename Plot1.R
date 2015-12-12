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
png("plot1.png", width=480, height=480)

#Plot
hist(GAP,xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power",yaxp  = c(0, 1200,6))
dev.off()


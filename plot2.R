data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")
data$Global_ative_power <- as.numeric(data$Global_active_power)
data$dateTime <- as.POSIXct(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")
data <- data[(data$dateTime>="2007-02-01") & (data$dateTime < "2007-02-03"),]
png("plot2.png")
plot(x=data$dateTime,y=data$Global_active_power,type = 1,xlab="",ylab="Global Active Power(kilowatts)",main="")
dev.off()
library(datasets)
alldata <- "./data/household_power_consumption.txt"
data <- read.table(alldata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
powerconsump2daysdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

date_time <- strptime(paste(powerconsump2daysdata$Date, powerconsump2daysdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_actpower <- as.numeric(powerconsump2daysdata$Global_active_power)

png("plot2.png", width=480, height=480)
plot(date_time, global_actpower, type="l", xlab=" ", ylab="Global Active Power (kilowatts)" )
dev.off()
rm(list=ls())
data <- read.table("household_power_consumption.txt",header= TRUE, sep =';', colClasses = "character", na.strings = "?")
df <- subset(data, as.Date(data$Date, "%d/%m/%Y") >= '2007-02-01' & as.Date(data$Date, "%d/%m/%Y") <= '2007-02-02')
rm(data)
datetime <- paste(as.Date(df$Date, "%d/%m/%Y"), df$Time)
df$Datetime <- as.POSIXct(datetime)
cols = c(3:9)
df[, cols] <- apply(df[,cols], 2, function(x) as.numeric(as.character(x)))
png(file="plot1.png",width=480,height=480, units= 'px')
hist(df$Global_active_power, col="red", main="Global Active Power", xlab = "Gloal Active Power (kilowatts)")
dev.off()




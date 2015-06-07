data1 <- read.table("household_power_consumption.txt",header=TRUE,na.strings="?",nrows=2075259,sep=';',check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

data <- subset(data1, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()





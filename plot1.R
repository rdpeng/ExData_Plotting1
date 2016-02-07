#import data, drop ? missing values
data <- read.table("household_power_consumption.txt", na.strings="?", sep=";", header=TRUE, stringsAsFactors=FALSE)
#converting to calendar date
data$Date<- as.Date(data$Date, format="%d/%m/%Y")
#subset only 2007-02-01, 2007-02-02 data
data <- subset(data, Date>="2007-02-01"&Date<="2007-02-02")
#converge date and time
DateTime <- paste(as.Date(data$Date), data$Time)
Date.Time <- as.POSIXct(DateTime)
#plotting
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
#make a copy
dev.copy(png, file="plot1.png",height=480,width=480)
dev.off()
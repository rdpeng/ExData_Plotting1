household <- read.csv("E:/Directory.R/explorotory data analysis/household.txt", sep=";")
subset <- household[household$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
powerplot <- as.numeric(subset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, powerplot, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

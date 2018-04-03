#read.table("household_power_consumption.txt",skip= ,nrows= )
powerData <-read.table("household_power_consumption.txt",nrows= 2880, sep=";", skip=66637)
header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
colnames(powerData) <- unlist(header)

powerData[,1] <- as.Date(powerData[,1], format="%d/%m/%Y")

powerData[,2] <- paste(powerData[,1], powerData[,2])
powerData[[2]] <- strptime(powerData[[2]], format="%Y-%m-%d %H:%M:%S")

png('plot2.png')

plot(powerData$Time, powerData$Global_active_power, type='n', xlab = 'datetime', ylab = "Global Active Power (kilowatts")
lines(powerData$Time, powerData$Global_active_power, type="l")

dev.off()



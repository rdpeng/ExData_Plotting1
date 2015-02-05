Columns <- c(rep("character", 2), rep("numeric", 7))
output <- read.table("household_power_consumption.txt", header = TRUE, sep=';', na.strings = "?", colClasses = Columns)
ok <- c(complete.cases(output$Date, output$Time))
output <- output[ok, ]
output$DateTime <- as.POSIXct(paste(output$Date, output$Time), format="%d/%m/%Y %H:%M:%S")
keeps <- c((output$DateTime >= "2007-02-01 00:00:00") & (output$DateTime <= "2007-02-02 24:00:00"))
output <- output[keeps, 3:10]
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")
hist(output$Global_active_power, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
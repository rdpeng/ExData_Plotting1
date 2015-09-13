## Read the file and cleanup the data
fileName <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileName, "data.zip")
unzip("data.zip")
df <- read.table(pipe("findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt"), sep = ";")
colnames <- read.table("household_power_consumption.txt", header = TRUE, nrows = 1, sep = ";")
names(df) <- names(colnames)
df[df == "?"] <- NA
df$datetime <- paste(df$Date, df$Time, sep = " ")
df$datetime <- strptime(df$datetime, "%d/%m/%Y %H:%M:%S")

##Plot 3
png(filename = "plot3.png", width = 480, height = 480)
plot(df$datetime, df$Sub_metering_1, ylab = "Energy Sub Metering", xlab = NA, type = "l")
lines(df$datetime, df$Sub_metering_2, col = "red")
lines(df$datetime, df$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = "solid")
dev.off()

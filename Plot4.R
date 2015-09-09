## Part 1 - this is repeated for all the plot files.
## If the data is already loaded then you can skip to Part 2.

# fetch the file from remote source, unzip and load into R
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists("local.zip")) {
  file.create("local.zip")
}
download.file(url, destfile = "local.zip")
unzip("local.zip", files = "household_power_consumption.txt")

f <- file("household_power_consumption.txt")
d <- read.csv(f, sep=";", na.strings = "?", stringsAsFactors = FALSE)

# get it down to the required data set before anything else and clear the large obj from memory
df <- d[d$Date == "1/2/2007" | d$Date == "2/2/2007", ]
rm(d)

# create proper date and time types
df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S", tz="America/New_York")
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df$Day <- weekdays(df$Date)


## Part 2 - this part is unique to this file
# create the plot
png(filename = "plot4.png")

# run this section on its own for plotting to the display
# par needs setting for a 4 * 4 layout
par(mfcol = c(2, 2), mar = c(5, 4, 2, 0.5), ps = 9, cex = 1, cex.main = 1)
# plot 1, 1
plot(df$Time, df$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

# plot 1, 2
plot(df$Time, df$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
points(df$Time, df$Sub_metering_1, type = "l", col = "black")
points(df$Time, df$Sub_metering_2, type = "l", col = "red")
points(df$Time, df$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = names(df)[grep("Sub*", names(df))]
       , lty = c(1, 1), lwd = c(1, 1), col = c("black", "red", "blue")
       , bty = "n")

# plot 2, 1
plot(df$Time, df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# plot 2, 2
plot(df$Time, df$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# close the device
dev.off()
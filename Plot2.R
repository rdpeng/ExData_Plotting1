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
png(filename = "plot2.png")

# run this section on its own for plotting to the display, assume par() needs setting up
par(mar = c(5, 4, 2, 1), ps = 12, cex = 1, cex.main = 1)
plot(df$Time, df$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# close the device
dev.off()
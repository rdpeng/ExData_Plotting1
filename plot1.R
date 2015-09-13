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

##Plot 1
png(filename = "plot1.png", width = 480, height = 480)
hist(df$Global_active_power,col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

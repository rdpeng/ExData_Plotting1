#1. dowload the file and unzip
folder <- "./data"
if(!file.exists(folder)) {dir.create(folder)}
fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fileName <- "household_power_consumption.zip"
fileDest <- paste(folder, fileName, sep="/")
if(!file.exists(fileDest)){ download.file(fileUrl, fileDest)}
file <- unzip(zipfile=fileDest, exdir=folder)

#2. read the file
powerName <- unlist(read.table(file, nrows=1, sep=";"))
powerDb <- read.table(text=grep("^[1,2]/2/2007", readLines(file), value=TRUE),
                      col.names = powerName,
                      sep=";", header = TRUE)
powerDb$Date <- as.Date(powerDb$Date, format="%d/%m/%Y")
DateTime <- paste(as.Date(powerDb$Date), powerDb$Time)
powerDb$DateTime <- as.POSIXct(DateTime)

#3. plotting 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(powerDb, {
    plot(Global_active_power~ DateTime, type="l",
         ylab="Gloal Active Power", xlab="")
    plot(Voltage~DateTime, type="l", ylab="Voltage", xlab="datetime")
    plot(Sub_metering_1~DateTime, type="l", ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~ DateTime, col="red")
    lines(Sub_metering_3~ DateTime, col="blue")
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           cex=0.6, x.intersp= 0.5, y.intersp = 0.6, inset=0.05,
           legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
    plot(Global_reactive_power~ DateTime, type="l",
         ylab="Global_rective_power", xlab="datetime")
})
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()

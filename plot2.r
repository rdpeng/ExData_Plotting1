#1.download and unzip
folder <-"./data"
if(!file.exists(folder)) {dir.create(folder)}
fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fileName <- "household_power_consumption.zip"
fileDest <- paste(folder, fileName, sep="/")
if(!file.exists(fileDest)) {download.file(fielUrl, fileDest)}
file <- unzip(zipfile=fileDest, exdir=folder)

#2. read the file
powerName <- unlist(read.table(file, nrows=1, sep=";"))
powerDb <- read.table(text=grep("^[1,2]/2/2007", readLines(file), value=TRUE),
                      col.names = powerName,
                      sep=";", header=TRUE)
powerDb$Date <- as.Date(powerDb$Date, format="%d/%m/%Y")
powerTime <- paste(as.Date(powerDb$Date), powerDb$Time)
powerDb$DateTime <- as.POSIXct(DateTime)

#3. plotting 2
plot(powerDb$Global_active_power~powerDb$DateTime, type="l",
     ylab="Global Active power (KiloWatts)", xlab="")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()

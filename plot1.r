#1.download the file and unzip
folder <- "./data"
if(!file.exists(folder)) {dir.create(foder)}
fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fileName <- "household_power_consumption.zip"
fileDest <- paste(folder, fileName, sep="/")
if(!file.exists(fileDest)){download.file(fileUrl, fileDest)}
file <- unzip(zipfile = fileDest, exdir=folder)

#2. read the file
powerName <- unlist(read.table(file,nrows = 1, sep=";"))
powerDb <- read.table(text = grep("^[1,2]/2/2007", readLines(file), value = TRUE), 
                      col.names = powerName, 
                      sep = ";", header = TRUE)
powerDb$Date <- as.Date(powerDb$Date, format="%d/%m/%Y")
DateTime <- paste(as.Date(powerDb$Date), powerDb$Time)
powerDb$DateTime <- as.POSIXct(DateTime)

#3.plotting 1
hist(powerDb$Global_active_power, col="red",
     main="Global Active Power",
     xlab = "Global Active Power (Kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()

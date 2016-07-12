# downloads zipfile to /data folder and extracts contents
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./data/exdata_data_household_power_consumption.zip")
unzip(zipfile="./data/exdata_data_household_power_consumption.zip", exdir="./data")

# have a quick look at the text file to see how to load it in properly
quicklook <- read.table("./data/household_power_consumption.txt", nrows=4, sep=";", header=TRUE)
quicklook
# load the column names
columns <- read.table("./data/household_power_consumption.txt", nrows=1, sep=";")
columns <- t(columns)
# load the data from the text file, starting at 1/2/2007 (-1 rows since first will go in as header) for 60min * 24hr * 2 days = 2880 rows
power <- read.table("./data/household_power_consumption.txt", skip=grep("1/2/2007", readLines("./data/household_power_consumption.txt"))-1,nrows=2880, sep=";", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
colnames(power) <- columns[,1]
power$datetime <- as.POSIXct(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")

#plots
#plot1
png(file="./data/plot1.png")
hist(power$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()
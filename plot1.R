url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
download.file(url,destfile="dataset.zip",mode="wb")
unzip ("dataset.zip")
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
              stringsAsFactors=F, quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
finaldata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
globalActivePower <- as.numeric(finaldata$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

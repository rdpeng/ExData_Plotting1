## getting full dataset
full_data <- read.csv("./household_power_consumption.txt", header=T, sep=";", 
                      na.strings="?", check.names=F, stringsAsFactors=F, 
                      comment.char="", quote='\"')

full_data$Date <- as.Date(full_data$Date, format="%d/%m/%Y")

## subsetting the data
data <- subset(full_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(full_data)

## Converting dates
dateTime <- paste(as.Date(data$Date), data$Time)
data$DateTime <- as.POSIXct(dateTime)

## plot 3
with(data, {
    plot(Sub_metering_1~DateTime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~DateTime,col='Red')
    lines(Sub_metering_3~DateTime,col='Blue')
})
legend("topright", lwd=1, col=c("Black","Red","Blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Saving to file
dev.copy(png, file="./plot3.png", height=480, width=480)
dev.off()


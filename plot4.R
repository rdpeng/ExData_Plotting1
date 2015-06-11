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

## plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(data, {
    plot(Global_active_power~DateTime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~DateTime, type="l",
         ylab="Voltage (volt)", xlab="datetime")
    plot(Sub_metering_1~DateTime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~DateTime,col='Red')
    lines(Sub_metering_3~DateTime,col='Blue')
    legend("topright", cex=0.7, lwd=2, bty="n", col=c("Black","Red","Blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    plot(Global_reactive_power~DateTime, type="l",
         ylab="Global Reactive Power (kilowatts)", xlab="datetime")
})

## Saving to file
dev.copy(png, file="./plot4.png", height=480, width=480)
dev.off()


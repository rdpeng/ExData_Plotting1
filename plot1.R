## read file
rawdata <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.string = "?")

## read 2-day data for plot
plotdata <- rawdata[as.Date(rawdata$Date, "%d/%m/%Y") %in% as.Date(c("2007-02-01","2007-02-02")),]

## Add a new vaiable DateTime to combine Date and Time
DateTime <- strptime(paste(plotdata$Date,plotdata$Time),"%d/%m/%Y %H:%M:%S")
plotdata <- cbind(plotdata, DateTime)

## plot1
png("plot1.png", width = 480, height = 480, units = "px")
hist(plotdata$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
data <- "household_power_consumption.txt"
alldata <- read.table(data, header=TRUE, sep=";", dec = ".")
df <- alldata[alldata$Date %in% c("1/2/2007", "2/2/2007"), ]

datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png(filename = "plot2.png", width = 480, height = 480)
plot(datetime, as.numeric(df$Global_active_power),type="l",xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

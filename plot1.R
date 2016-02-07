data <- "household_power_consumption.txt"
alldata <- read.table(data, header=TRUE, sep=";")
df <- alldata[alldata$Date %in% c("1/2/2007", "2/2/2007"), ]

##make the histogram graph
png(filename = "plot1.png", width=480, height = 480)
hist(as.numeric(df$Global_active_power), col = "red", main= "Global Active Power", xlab= "Global Active Power", ylab = "Frequency")
dev.off()
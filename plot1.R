powerdat <- read.csv("~/Documents/R/Coursera/household_power_consumption.txt", 
    sep=";", na.strings = "?", stringsAsFactors = FALSE)
plot1 <- hist(powerdat$Global_active_power, col = "red", main = "Global 
    Active Power", xlab = "Global Active Power (kilowatts)", 
    ylab = "Frequency")
dev.copy(device = png, file = "plot1.png") #saves plot from r as a png
dev.off()

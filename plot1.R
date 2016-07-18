generatePlot_1 <- function() {
data <- read.table("household_power_consumption.txt", sep = ";",na.strings = "?", header = TRUE)
head(data)
subData <- subset(data, as.Date(data$Date, format = "%d/%m/%Y")>= "2007-02-01" & as.Date(data$Date, format = "%d/%m/%Y") <= "2007-02-02" )
hist(subData$Global_active_power,col = "Red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power",breaks = 20)
dev.copy(png,file = "plot1.png",width = 480,height = 480, units = "px")
dev.off()
}
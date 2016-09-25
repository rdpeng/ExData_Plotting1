# road the data (file location is local path)
data <- file("/Users/choi/Documents/Education_2016MOOC/Sub4_ExploratoryDataAnalysis/Week1/data/household_power_consumption.txt")
data_sub <- read.table(text = grep("^[1,2]/2/2007", readLines(data), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = FALSE)

# Making Plot 1
hist(data_sub$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
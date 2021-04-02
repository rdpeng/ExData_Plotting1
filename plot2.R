total_data <- read.csv("C:/Users/nikhi/Desktop/R/ExData_Plotting1/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
total_data$Date <- as.Date(total_data$Date, format="%d/%m/%Y")
# Subsetting data
data <- subset(total_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(total_data)
#converting Date 
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
# Plot 2
plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
# Save the file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
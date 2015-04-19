## get the entire dataset 
household_power_consumption <- read.csv("~/Downloads/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")
## subset the data in accordance with the project specifications
data <- subset(household_power_consumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## convert Date and Time variables
data$datetime <- as.POSIXct(paste(data$Date, data$Time, sep=" ")) ##, "%Y-%m-%d %H:%M:%S")

## draw plot 2
plot(data$Global_active_power~data$datetime, type = "l",xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
## get the entire dataset 
household_power_consumption <- read.csv("~/Downloads/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")
## subset the data in accordance with the project specifications
data <- subset(household_power_consumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
# create plot1
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
# save the histogram as a png file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()

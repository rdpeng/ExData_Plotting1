# Read data, convert dates and subset on two days in February 2007
household_data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
household_data$DateTime <- strptime(paste(household_data$Date, household_data$Time), "%d/%m/%Y %H:%M:%S")

household_data <- subset(household_data, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))
head(household_data)


#### Plot1
#plot and save graph
png(filename="plot1.png", width=480, height=480, units="px")
with(household_data, hist(Global_active_power, col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))
dev.off()

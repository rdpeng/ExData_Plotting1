data <- read.table(file="household_power_consumption.txt", sep=";",header=TRUE, na.strings="?")

data$date_time  <- paste(data$Date,data$Time)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time, format="%H:%M:%S")
data$date_time <- strptime(data$date_time, format="%d/%m/%Y %H:%M:%S")

# Subset by date
data <- subset (data, data$Date=="2007-02-01"|data$Date=="2007-02-02")


attach(data)


# Plot2

Sys.setlocale("LC_TIME", "eng")
png("plot2.png", width=480, height=480, units="px")
plot(date_time,Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()


## read in data


data <- read.table("household_power_consumption.txt",
                   sep=";", header=TRUE, na.strings = "?")

## isolate dates of interest

data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

## change datastype of date and time

data$Date = strptime(data$Date, format = "%d/%m/%Y")

## open png

png(file = "plot2.png")

## create plot

with(data, plot(strptime(paste(data$Date,data$Time), format = "%Y-%m-%d %T"),
                Global_active_power, type="l",
                xlab="",
                ylab = "Global Active Power (kilowatts)"))

## close png

dev.off()
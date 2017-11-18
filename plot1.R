## read in data


data <- read.table("household_power_consumption.txt",
                   sep=";", header=TRUE, na.strings = "?")

## isolate dates of interest

data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

## change datastype of date and time

data$Date = strptime(data$Date, format = "%d/%m/%Y")

## open png

png(file = "plot1.png")

## create plot

with(data, hist(Global_active_power,
                col="red", xlab = "Global Active Power (kilowatts)",
                main="Global Active Power"))

## close png

dev.off()

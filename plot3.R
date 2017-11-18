## read in data

data <- read.table("household_power_consumption.txt",
                   sep=";", header=TRUE, na.strings = "?")

## isolate dates of interest

data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

## change datastype of date and time

data$Date = strptime(data$Date, format = "%d/%m/%Y")

## open png

png(file = "plot3.png")

## create plot

with(data, plot(x = strptime(paste(Date,Time), format = "%Y-%m-%d %T"),
            y =  Sub_metering_1,
            col = "black",
                type="l",
                xlab="",
                ylab = "Energy sub metering"))

with(data, points(x = strptime(paste(Date,Time), format = "%Y-%m-%d %T"),
       y =  Sub_metering_2,
       type = "l",
       col = "red"))

with(data, points(x = strptime(paste(Date,Time), format = "%Y-%m-%d %T"),
                  y =  Sub_metering_3,
                  type = "l",
                  col = "blue"))

legend("topright", 
          c("Sub_metering_1", "Sub_metering_2", "Sub_metering_2"),
          lty = 1,
          col = c("black", "red", "blue"))

## close png

dev.off()

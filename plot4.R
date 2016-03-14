# plot4.R

# readr needed for read_delim
library(readr)
# Read the semicolon-separated file, with specified column types
powerData <- read_delim("data/household_power_consumption.txt",
                        delim = ";",
                        col_types = "ccnnnnnnn",
                        na = c("?"))

# Checkif the data looks OK
str(powerData)
summary(powerData)

# Process the data - change to DateTime, filter the dates of interest,
# select just the columns needed for the plot
library(dplyr)
library(lubridate)

plotData <- mutate(powerData, DateTime = dmy_hms(paste(Date, " ", Time), tz="America/Los_Angeles")) %>%
    filter(DateTime >= "2007-02-01" & DateTime < "2007-02-03") %>%
    #filter(DateTime >= "2007-02-01" & DateTime <= "2007-02-02 23:59:59") %>%
    select(DateTime,
           Global_active_power, Global_reactive_power,
           Voltage, Sub_metering_1, Sub_metering_2, Sub_metering_3)
str(plotData)
summary(plotData$DateTime)

# Alternative 1 - build plot, then copy into file
# Disadvantage: the copy may not be accurate
par(mfrow = c(2, 2), mar = c( 4, 4, 2, 1), oma = c( 0, 0, 2, 0))

with(plotData,
     plot(DateTime, Global_active_power,
          type="l",
          xlab="", ylab="Global Active Power"))

with(plotData,
     plot(DateTime, Voltage,
          type="l",
          xlab="datetime", ylab="Voltage"))

with(plotData,
     plot(DateTime, Sub_metering_1,
          type="l",
          col="black",
          xlab="", ylab="Energy sub metering"))
with(plotData,
     points(DateTime, Sub_metering_2,
            type="l",
            col="red"))
with(plotData,
     points(DateTime, Sub_metering_3,
            type="l",
            col="blue"))
legend("topright",
       lty=c(1,1,1), bty='n', cex=0.8,
       col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(plotData,
     plot(DateTime, Global_reactive_power,
          type="l",
          xlab="datetime", ylab="Global_reactive_power"))

par(mfrow = c(1, 1))
dev.copy(png, file="plot4.1.png", width=480, height=480)
dev.off()

# Alternative 2 - create the appropriate graphics file device, then build the plot
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2), mar = c( 4, 4, 2, 1), oma = c( 0, 0, 2, 0))

with(plotData,
     plot(DateTime, Global_active_power,
          type="l",
          xlab="", ylab="Global Active Power"))

with(plotData,
     plot(DateTime, Voltage,
          type="l",
          xlab="datetime", ylab="Voltage"))

with(plotData,
     plot(DateTime, Sub_metering_1,
          type="l",
          col="black",
          xlab="", ylab="Energy sub metering"))
with(plotData,
     points(DateTime, Sub_metering_2,
            type="l",
            col="red"))
with(plotData,
     points(DateTime, Sub_metering_3,
            type="l",
            col="blue"))
legend("topright",
       lty=c(1,1,1), bty='n', cex=0.8,
       col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(plotData,
     plot(DateTime, Global_reactive_power,
          type="l",
          xlab="datetime", ylab="Global_reactive_power"))

par(mfrow = c(1, 1))
dev.off()

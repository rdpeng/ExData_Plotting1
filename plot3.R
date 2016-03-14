# plot3.R

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

metering <- mutate(powerData, DateTime = dmy_hms(paste(Date, " ", Time), tz="America/Los_Angeles")) %>%
    filter(DateTime >= "2007-02-01" & DateTime < "2007-02-03") %>%
    select(DateTime, Sub_metering_1, Sub_metering_2, Sub_metering_3)
str(metering)

# Alternative 1 - build plot, then copy into file
# Disadvantage: the copy may not be accurate
with(metering,
     plot(DateTime, Sub_metering_1,
          type="l",
          col="black",
          xlab="", ylab="Energy sub metering"))
with(metering,
     points(DateTime, Sub_metering_2,
          type="l",
          col="red"))
with(metering,
     points(DateTime, Sub_metering_3,
            type="l",
            col="blue"))
legend("topright",
       lty=c(1,1,1),
       col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.1.png", width=480, height=480)
dev.off()

# Alternative 2 - create the appropriate graphics file device, then build the plot
png("plot3.png", width=480, height=480)
with(metering,
     plot(DateTime, Sub_metering_1,
          type="l",
          col="black",
          xlab="", ylab="Energy sub metering"))
with(metering,
     points(DateTime, Sub_metering_2,
            type="l",
            col="red"))
with(metering,
     points(DateTime, Sub_metering_3,
            type="l",
            col="blue"))
legend("topright",
       lty=c(1,1,1),
       col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

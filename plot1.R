# plot1.R

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
names(powerData)

# Alternative 1 - build plot, then copy into file
# Disadvantage: the copy may not be accurate
hist(powerData$Global_active_power,
     col="red", bg="transparent",
     main="Global Active Power",
     xlab="Global Active Power", ylab="Frequency",
     xlim=c(0,6))
dev.copy(png, file="plot1.1.png", width=480, height=480)
dev.off()

# Alternative 2 - create the appropriate graphics file device, then build the plot
png("plot1.png", width=480, height=480)
hist(powerData$Global_active_power,
     col="red", bg="transparent",
     main="Global Active Power",
     xlab="Global Active Power", ylab="Frequency",
     xlim=c(0,6))
dev.off()


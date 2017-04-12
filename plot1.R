file <- "household_power_consumption.txt"
if (!file.exists(file)) {
        download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip", method= "curl")
        unzip("data.zip")
        file.remove("data.zip")
}

#Use readr's read_csv2
library(readr)
data <- read_delim(file = file, delim =";")

# Mutate Date default characters to proper Date class with lubridate's package
library(lubridate)
library(dplyr)
data <- mutate(data,Date=dmy(Date)) %>% filter(ymd(Date) %in% ymd(c("2007-02-01","2007-02-02")))

# Create hist and save it
hist(data$Global_active_power, main= "Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.copy(png, file ="plot1.png")
dev.off()

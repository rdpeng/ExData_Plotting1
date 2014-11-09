library(dplyr)

household <- read.csv("household_power_consumption.txt", header = T, 
                      sep=';', na.strings="?")
## formatting the date field 
household$Date <- as.Date(household$Date, format="%d/%m/%Y")
## Filter out only those data set containing 2007-02-01 or 2007-02-02
householdFeb2007 <- filter(household, Date ==  "2007-02-01" | Date == "2007-02-02")
rm(household)

datetime <- paste(as.Date(householdFeb2007$Date), householdFeb2007$Time)
householdFeb2007$Datetime <- as.POSIXct(datetime)

## To create step for saving generated plot to file
png(file="plot2.png", height=480, width=480)

plot(householdFeb2007$Global_active_power~householdFeb2007$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## saving to file
dev.off()

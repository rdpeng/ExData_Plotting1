# Download a subset of house_water_consumption.txt
# Subset Dataframe by Date between 2007-02-01 (Thursday) and 2007-02-02 (Friday).

library(lubridate)
# Convert txt file to Dataframe
df <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", dec=".")

# Subset Dataframe by Date
df2 <- df[(df$Date == "1/2/2007" | df$Date == "2/2/2007"), ]

# Tranform Date and Time from character to date
df2$DateTime <- strptime(paste(df2$Date, df2$Time), format="%d/%m/%Y %H:%M:%S")

# Plot of "day of the week" vs "Global_active_power"
df2$Global_active_power <- as.numeric(as.character(df2$Global_active_power))

png(file = "plot2_1.png", width = 480, height = 480)

plot(df2$DateTime , df2$Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()

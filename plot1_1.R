# Download a subset of house_water_consumption.txt
# Convert txt file to Dataframe
df <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", dec=".")

# Subset Dataframe by Date
df2 <- df[(df$Date == "1/2/2007" | df$Date == "2/2/2007"), ]

# Tranform Date from character to date
df2$Date <- as.Date(df2$Date, "%m/%d/%Y")

# PLOT 1
# Frequency histogram of "Global_active_power"
df2$Global_active_power <- as.numeric(df2$Global_active_power)

png(file = "plot1_1.png", width = 480, height = 480)

hist(df2$Global_active_power, col = "Red", main= "Global Active Power",xlab="Global Active Power (Kilowatts)")

dev.off()

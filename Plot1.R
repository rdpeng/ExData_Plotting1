# To get the required Data

data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", 
                   colClasses=c("character", "character", rep("numeric",7)), na="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
reqdata <- subset(data, Date %in% dates)

# Plot- 1
## reqdata$Global_active_power <- as.numeric(reqdata$Global_active_power)
png("plot1.png", width = 400, height = 400)
hist(reqdata$Global_active_power, col = "red", 
     xlab = " Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

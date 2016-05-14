# Imports data
fd <- read.table("household_power_consumption.txt", header = TRUE
                        , sep = ";", na.strings = "?", 
                        colClasses = c("character", "character", rep("numeric", 7)))

# Subsets data
fd$Date <- as.Date(fd$Date, format = "%d/%m/%Y")
fd$Time <- strptime(fd$Time, format = "%H:%M:%S")
fd_Feb07 <- subset(fd, Date == "2007-02-01" | Date == "2007-02-02")

# Opens PNG device; create "plot1.png" in my working directory
png(file = "plot2.png", width = 480, height = 480)

# Sets parameters
par(mar = c(5, 5, 4, 1), cex.axis = 0.8, cex.lab = 0.8)

# Creates plot
with(fd_Feb07, {
        plot(Global_active_power, type = "n", 
                    xaxt = "n", xlab = "", ylab = "")
        lines(Global_active_power)
})

v1 <- c(0, 1440, 2880) ## define position of x-axis tick marks 
v2 <- c("Thu", "Fri", "Sat") ## define labels of x-axis tick marks
axis(1, v1, v2) ## draw x-axis

# Annotates (y-axis ttile)
title(ylab = "Global Active Power (kilowatts)")

# Closes PNG file device
dev.off()
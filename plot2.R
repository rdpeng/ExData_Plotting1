# First, assuming that the .txt file is in the working directorry, load the file into R.
x0 <- read.table("household_power_consumption.txt", sep = ";", na.strings="?", stringsAsFactors = FALSE, header = TRUE)

# Transform the Date into real 'Date' format
x0$Date <- as.Date(x0$Date, "%d/%m/%Y")

# Select the rows corresponding of the date between 2007-02-01 and 2007-02-02
x1 <- subset(x0, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
# OR
# x1 <-x0[which(x0$Date == "2007-02-01" | epc_data$Date == "2007-02-02")] can be OK

# Integrate and Transform the Date and Time format
x1$DateTime <- paste(x1$Date, x1$Time, sep=",")
x1$DateTime <- strptime(x1$DateTime, format = "%Y-%m-%d,%H:%M:%S")
x1$DateTime <- as.numeric(x1$DateTime)

# open the image device
png(filename = "plot2.png", width = 480, height = 480, units = "px")

# Set a white background
par(bg = 'white')

# Create a plot on screen device
plot(x1$DateTime, x1$Global_active_power, xlab = " ", ylab ="Global Active Power (kilowatts)", xaxt = "n", type ="l")

# Create a x-axis label Thu / Fri / Sat
Date_at <- list(x1$DateTime[1], x1$DateTime[1441], x1$DateTime[2880])
axis(side = 1, at = Date_at, labels = c("Thu","Fri","Sat"))

# Close the PNG file
dev.off()
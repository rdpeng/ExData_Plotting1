# First, assuming that the .txt file is in the working directorry, load the file into R.
x0 <- read.table("household_power_consumption.txt", sep = ";", na.strings="?", stringsAsFactors = FALSE, header = TRUE)

# Transform the Date into real 'Date' format
x0$Date <- as.Date(x0$Date, "%d/%m/%Y")

# Select the rows corresponding of the date between 2007-02-01 and 2007-02-02
x1 <- subset(x0, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
# OR
# x1 <-x0[which(x0$Date == "2007-02-01" | epc_data$Date == "2007-02-02")] can be OK

# open the image device
png(filename = "plot1.png", width = 480, height = 480, units = "px")

# Set a white background
par(bg = 'white')

# Create a plot on screen device (title, labels, color)
hist(x1$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red", ylim = c(0,1200), breaks = 12)

# Close the PNG file
dev.off()
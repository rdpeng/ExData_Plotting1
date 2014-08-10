# read the whole data set (further enquiry: reading the data but only storing the needed)
data <- read.table("household_power_consumption.txt", sep = ";", colClasses = "character", header = TRUE)

# subset the data by date after changing the format of the dates
dat <- data[as.Date(data$Date, format = '%d/%m/%Y') %in% as.Date(c('2007-02-01', '2007-02-02')), ]
dat <- na.omit(dat)

# free up memory taken by data by removing data
rm(data)

# Concatenate the date & time columns into the date column
# convert the dates & times to Date/Time classes in R & reassign to the 
# date column
dat$Date  <- strptime(paste(dat$Date, dat$Time), format = '%d/%m/%Y %H:%M:%S')

# convert columns V3, V4, & V5 to numeric
dat$Global_active_power  <- as.numeric(dat$Global_active_power)
dat$Global_reactive_power  <- as.numeric(dat$Global_reactive_power)
dat$Voltage  <- as.numeric(dat$Voltage)

# base plot3 - annotated base plot
plot(dat$Date, dat$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dat$Date, dat$Sub_metering_2, col = "red", ylim=c(0, 40))
lines(dat$Date, dat$Sub_metering_3, col = "blue", ylim = c(0, 40))
legend("topright", lty = "solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

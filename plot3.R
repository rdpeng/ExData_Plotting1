# read the data file skipping 66636 lines and only reading the first 2280 lines
dat <- read.table("household_power_consumption.txt", sep = ";", colClasses = "character", header = TRUE, skip = 66636, nrows = 2880)

# rename the column names
names(dat) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Concatenate the date & time columns into the date column
# convert the dates & times to Date/Time classes in R & reassign to the 
# date column
dat$Date  <- strptime(paste(dat$Date, dat$Time), format = '%d/%m/%Y %H:%M:%S')

# convert columns V3, V4, & V5 to numeric
dat$Global_active_power  <- as.numeric(dat$Global_active_power)
dat$Global_reactive_power  <- as.numeric(dat$Global_reactive_power)
dat$Voltage  <- as.numeric(dat$Voltage)

# base plot3 - annotated base plot
png(filename = "./ExData_Plotting1/figures/plot3.png") ## Open PNG device; create 'plot4.png' in my working directory
## Create plot and send to a file (no plot appears on screen)
with(dat, {
        plot(dat$Date, dat$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
        lines(dat$Date, dat$Sub_metering_2, col = "red", ylim=c(0, 40))
        lines(dat$Date, dat$Sub_metering_3, col = "blue", ylim = c(0, 40))
        legend("topright", lty="solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off() ## Close the PNG file device
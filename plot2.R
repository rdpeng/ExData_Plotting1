# read the data file skipping 66636 lines and only reading the first 2880 lines
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

# base plot2 - scatter base plot
png(filename = "./ExData_Plotting1/figures/plot2.png") ## Open PNG device; create 'plot4.png' in my working directory
plot(x = dat$Date, y = dat$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()
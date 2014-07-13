
## Read data

gpa <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header=TRUE, sep=';')

## Subset Data for the Date Range

gpa2 <- subset(gpa, Date=="1/2/2007" | Date=="2/2/2007")

dt <- strptime(paste(hpc2$Date, hpc2$Time), "%d/%m/%Y %H:%M:%S")


plot(dt, as.numeric(gpa2$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")

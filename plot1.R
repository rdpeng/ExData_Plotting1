library(lubridate)
#first line that appears with this date
day1 <- grep('1/2/2007',readLines("household_power_consumption.txt"))[1]
#first day of the date we no longer require
day3 <- grep('3/2/2007',readLines("household_power_consumption.txt"))[1]
my_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows = day3-day1, skip = day1 - 2, na.string = "?")
#check only available dates are the desired ones
summary(my_data)

#assign the correct column names
titles <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
names(my_data) <- titles

my_data$Time <- hms(my_data$Time)
#to get a rough idea of what the plot will look like
globalfrequencyplot <- table(round(my_data$Global_active_power))

#plot number 1
png(file = "plot1.png", bg = "white", width = 480, height = 480)
hist(my_data$Global_active_power, breaks = 12, xlab = "Global active power (kilowatts)", main = "Global Active Power", col = 2)
dev.off()
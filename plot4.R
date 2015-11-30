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

my_data$datetime <- strptime(paste(my_data$Date, my_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


#####plot number 4
png(file = "plot4.png", bg = "white", width = 480, height = 480)
#we require 4 pannels distributed by 2 rows and 2 columns
par(mfrow=c(2,2))

#first plot
plot(my_data$datetime, my_data$Global_active_power, xlab = '', ylab = "Global active power (kilowatts)", type = 'l')

#second plot
plot(x = my_data$datetime, y = my_data$Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'l')
 
#third plot
plot(x = my_data$datetime, y = my_data$Sub_metering_1 , xlab = '', ylab = "Energy sub metering", type = 'n') 
lines(x = my_data$datetime, y =my_data$Sub_metering_1, type = 'l', col = 'black')
#we need to plot the points united by lines
lines(x = my_data$datetime, y =my_data$Sub_metering_2, type = 'l', col = 'red')
lines(x = my_data$datetime, y =my_data$Sub_metering_3, type = 'l', col= 'blue')
#to ensure the coloured lines show up in the legend, the parameter lty needs to be included
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c('black', 'red', 'blue'), lty =c(1,1,1))
 
#fourth plot
plot(x = my_data$datetime, y = my_data$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')
dev.off()
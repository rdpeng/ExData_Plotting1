##
##
## Need to have the dplyr package loaded
##
library(dplyr)

source_data <- "C:/EDA/household_power_consumption.txt"



data <- read.table(source_data, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

data$Date_Time <- with(data, paste(Date, Time))
data$Date <- with(data, as.POSIXct(Date, format = "%d/%m/%Y"))
data$Date_Time  <- with(data,  as.POSIXct(Date_Time, format = "%d/%m/%Y %H:%M:%S"))



plot_data <- filter(data, (Date >= "2007-02-01" & Date <= "2007-02-02"))


png("./Plot3.png")

with(plot_data, plot(Date_Time, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n"))
with(plot_data, lines(Sub_metering_1 ~ Date_Time, col = "black"))
with(plot_data, lines(Sub_metering_2 ~ Date_Time, col = "red"))
with(plot_data, lines(Sub_metering_3 ~ Date_Time, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))



dev.off()










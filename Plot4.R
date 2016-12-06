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



png("./Plot4.png")

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

with(plot_data, {    ## Begin Plotting Commands
  
  plot(Date_Time, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", pch = NA_integer_, lines(Global_active_power ~ Date_Time, lwd = 1))
  
  plot(Date_Time, Voltage, xlab = "datetime", ylab = "Voltage", pch = NA_integer_, lines(Voltage ~ Date_Time, lwd = 1))
  
  plot(Date_Time, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
    lines(Sub_metering_1 ~ Date_Time, col = "black")
    lines(Sub_metering_2 ~ Date_Time, col = "red")
    lines(Sub_metering_3 ~ Date_Time, col = "blue")
    legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
  plot(Date_Time, Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "n")
    lines(Global_reactive_power ~ Date_Time, lwd = 1)
  
                }  ## End Plotting Commands
)  ## End with(plot_data)


dev.off()










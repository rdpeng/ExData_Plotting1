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


png("./Plot1.png")


with(plot_data, hist(Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)"))



dev.off()










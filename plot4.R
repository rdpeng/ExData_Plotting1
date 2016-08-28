
# Load packages dplyr and car
library(car)
library(dplyr)

# Function to convert string to POSIXct Date
formatAsDate <- function(date.string) {
  date = as.POSIXct(as.character(date.string), format = '%d/%m/%Y %H:%M:%S')
  return(date)
}

# Read data (with 16GB RAM, I might as well do it) + encode NA
power.data.raw = read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                            stringsAsFactors = FALSE, na.strings = c("?"))

# Subset dataframe %>% Format date
power.data = power.data.raw %>%
  filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
  mutate(DateTime = formatAsDate(paste(Date, Time))) %>%
  mutate(Global_active_power = as.numeric(Global_active_power))

# Getting superficially famililar with the data
dim(power.data)
names(power.data)
some(power.data)

# Generating plot 4
with(power.data, {
  # Setting global plotting paramters
  par(bg = NA, mar = c(5,5,1,1), mfcol = c(2,2)) 
  # Generate top left plot: Global Active Power
  plot(Global_active_power, ylab = "Global Active Power", 
       xaxt = "n", xlab = "", type = "n") 
  lines(Global_active_power)
  axis(1, at = nrow(power.data) * c(0,0.5,1), labels = c("Thu", "Fri", "Sat"))
  # Generate bottom left plot: Energy Sub metering
  plot(Sub_metering_1, ylab = "Energy sub metering", 
       xaxt = "n", xlab = "", type = "n") 
  lines(Sub_metering_1, col = "black")
  lines(Sub_metering_2, col = "red")
  lines(Sub_metering_3, col = "blue")
  axis(1, at = nrow(power.data) * c(0,0.5,1), labels = c("Thu", "Fri", "Sat"))
  legend("topright", col = c("black", "red", "blue"), lwd = 1,
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  # Generate top right plot: Voltage
  plot(Voltage, xlab = "datetime", xaxt = "n", type = "n")
  lines(Voltage)
  axis(1, at = nrow(power.data) * c(0,0.5,1), labels = c("Thu", "Fri", "Sat"))
  # Generate bottom right plot: Global Reactive Power
  plot(Global_reactive_power, xlab = "datetime", xaxt = "n", type = "n")
  lines(Global_reactive_power)
  axis(1, at = nrow(power.data) * c(0,0.5,1), labels = c("Thu", "Fri", "Sat"))
})

# Save plot from screen device to png
dev.copy(png, filename = "plot4.png")
dev.off()

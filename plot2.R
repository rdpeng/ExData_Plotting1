
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

# Generating plot 2
with(power.data, {
  par(bg = NA, mar = c(3,5,1,1)) 
  plot(Global_active_power, ylab = "Global Active Power (kilowatts)", 
       xaxt = "n", xlab = "", type = "n") 
  lines(Global_active_power)
  axis(1, at = nrow(power.data) * c(0,0.5,1), labels = c("Thu", "Fri", "Sat"))
})

# Save plot from screen device to png
dev.copy(png, filename = "plot2.png")
dev.off()

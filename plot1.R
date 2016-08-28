
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

# Generating plot 1
with(power.data, {
  par(bg = NA) 
  hist(Global_active_power, col = "red", main = "Global Active Power", 
       xlab = "Global Active Power (kilowatts)") 
  })

# Save plot from screen device to png
dev.copy(png, filename = "plot1.png", bg = "transparent")
dev.off()


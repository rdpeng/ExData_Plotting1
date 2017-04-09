### loading lubridate and dplyr packages
library("lubridate")
library("dplyr")

### reading the data
file = "household_power_consumption.txt"
df <- read.table(file, header = TRUE, sep = ";", na.strings = "?")

### subsetting the requested dates
dates <- c(ymd("2007-02-01"), ymd("2007-02-02"))
df_subset <- df %>% filter(is.element(dmy(Date),dates)) %>%
    mutate(Date = dmy(Date), Time = hms(Time))

### plotting the histgram of global active power    
png(file="plot1.png", width=480, height=480)
hist(df_subset$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()

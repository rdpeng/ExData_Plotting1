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


### plotting the Global active Power
png(file="plot2.png", width=480, height=480)
plot(df_subset$Global_active_power, type="l", xaxt = 'n', xlab="", ylab="Global Active Power (kilowatts)")
tick_coord <- c(0,0.5,1) * length(df_subset$Global_active_power)
axis(1,at=tick_coord, labels=c("Thursday", "Friday", "Saturday"))
dev.off()
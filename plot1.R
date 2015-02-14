### read in all the data
### About 150M in memorey, not too big to fit in the memeory
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', 
                            na.strings = "?", stringsAsFactors = FALSE)

### convert Date into date format 
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

### only keep the data for these two days
data2 <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
### no need for the whole data anymore
rm(data)

### convert the measures into numeric
data2[, -c(1,2)] = lapply(data2[,-c(1,2)], as.numeric)

### construct the data.time field
date.time <- paste(as.Date(data2$Date), data2$Time)
data2$date.time <- as.POSIXct(date.time)

### save the this data frame for following plots
save(data2, file = "data2.RData")


## Plot No 1 
hist(data2$Global_active_power, main = "Global Active Power", col = "red", 
        xlim = c(0,6), ylim = c(0, 1200), 
        xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

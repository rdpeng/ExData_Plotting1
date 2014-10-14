data_file <- "household_power_consumption.txt"

first_row <- read.table(data_file, header = TRUE,
                        sep = ";", na.strings = "?", stringsAsFactors = FALSE,
                        nrows = 1)

column_names <- colnames(first_row)

# First datetime in file; there's one row for each minute

file_start_datetime <- strptime(paste(Date, Time, sep = " "),
                                format = "%d/%m/%Y %H:%M:%S")

# Column classes

classes <- sapply(first_row, class)

# Start and end datetimes for the range of interest

start_datetime <- strptime("2007-02-01 00:00:00", format = "%Y-%m-%d %H:%M:%S")
end_datetime <- strptime("2007-02-02 23:59:00", format = "%Y-%m-%d %H:%M:%S")

# Determine the number of rows to skip and the number to read

skips <- difftime(start_datetime, file_start_datetime, units = "mins")
reads <- difftime(end_datetime, start_datetime, units = "mins")+1

# Use colClasses, skip and nrows to load data quickly

data <- read.table(data_file, header = TRUE,
                   sep = ";", na.strings = "?",
                   colClasses = classes,
                   skip = skips,
                   nrows = reads)

# Recover column names

colnames(data) <- column_names

for(i in 1:2880){
  jj[i] <- strptime(paste(data[i, 1], data[i, 2], sep = " "), "%d/%m/%Y %H:%M:%S")
}
DT <- as.POSIXct(jj)

# Generate the graph

windows()

png(filename = "plot3.png", width = 480, height = 480)

plot(DT, data$Sub_metering_1, 
     type = "l", 
     xlab = "", 
     ylab = "Energy sub metering")

lines(DT, data$Sub_metering_3, 
      col = "blue")

lines(DT, data$Sub_metering_2, 
      col = "red")

legend("topright", 
       col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1, 1))

dev.off()
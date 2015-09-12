# save the file "household_power_consumption.txt" in the working directory
# load the dataset in R as data.frame named 'hpc'
hpc <- read.table ("./household_power_consumption.txt", header = TRUE, sep =";", na.strings = "?", comment.char = "")
# load the package 'dplyr'
library (dplyr)
# filter the records within the interval [1/1/2007, 2/2/2007]
hpc2 <- hpc %>% filter (Date == "1/2/2007" | Date == "2/2/2007")
# note that tthe columns 'Date' and 'Time' are character/factorial variables
# add a new column 'Date.Time' merging 'Date' and 'Time' with the blank space as separator
hpc2 <- mutate (hpc2, Date.Time = paste(Date, Time))
# convert the char variable 'Date.Time' in a Date/Time variable
# '28/12/2006 23:45:58' --> '2006-12-28 23:45:58'
hpc2$Date.Time <- strptime (hpc2$Date.Time, "%d/%m/%Y %H:%M:%S")
# the above command convert 'Date.Time' in a POSIXlt variable, but
# the class POSIXct' is more convenient in a data.frame, then
# convert the POSIXlt variable in a POSIXct variable
hpc2$Date.Time <- as.POSIXct (hpc2$Date.Time)
# exclude the 'Date' and 'Time' char-columns
# to obtain a clean/tidy data.frame to generate the requested plot
hpc2 <- hpc2 %>% select (-c(1,2))
# to export the data.frame using 'dput (hpc2, file = "hpc2.R")'
# to import the data.frame, use 'hpc2 <- dget ("./hpc2.R")'
# print the plot n. 3 as PNG file
png (filename = "plot3.png", width = 480, height = 480, units ="px", type = "windows")
# create the plot n. 3
# calculate the 'total' range of Y values
yrangemin <- min (min (hpc2$Sub_metering_1), min (hpc2$Sub_metering_2), min (hpc2$Sub_metering_3))
yrangemax <- max (max(hpc2$Sub_metering_1), max (hpc2$Sub_metering_2), max (hpc2$Sub_metering_3))
yrange <- c (yrangemin, yrangemax)
# calculate the range of X values
xrange <- range (hpc2$Date.Time)
# plot the x and y ranges with the option type = "n" for no-plotting!
plot (xrange, yrange, type = "n", xlab = "", ylab = "Energy sub metering")
# plot the 3 variables 'Sub_metering_*' as lines over the 'blank' plot
lines (hpc2$Date.Time, hpc2$Sub_metering_1, col = "black")
lines (hpc2$Date.Time, hpc2$Sub_metering_2, col = "red")
lines (hpc2$Date.Time, hpc2$Sub_metering_3, col = "blue")
#create the requested legend
legend_names <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend_cols <- c ("black", "red", "blue")
legend ("topright", lty = 1, legend = legend_names, col = legend_cols )
# turn off the PNG graphic device
dev.off()

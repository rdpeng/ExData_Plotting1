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
# print the plot n. 2 as PNG file
png (filename = "plot2.png", width = 480, height = 480, units ="px", type = "windows")
# create the plot n. 2
# plot the data.frame using the option type = "n" for no-plotting!
plot (hpc2$Date.Time, hpc2$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatt)")
# use the funtcion 'lines ()' to draw the line graph over the 'blank' plot
lines (hpc2$Date.Time, hpc2$Global_active_power)
# turn off the PNG graphic device
dev.off()

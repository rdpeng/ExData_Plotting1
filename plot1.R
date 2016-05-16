#Download the data into a working directory. Extract it. The file is not loaded to github as it is quite large

#Load dependent libraries
library(dplyr)

#Download the file and load using read.csv. Separattor in the file is ";". Missing values in the data are coded as "?". 
elecpowerconsum <- read.csv("../household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

#Wrap the local data frame using tbl_df. Helps with printing
elecpowerconsum_tbl <- tbl_df(elecpowerconsum)

#Goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007. Filter the dataset
elecpowerconsum_feb <- filter(elecpowerconsum_tbl, Date %in% c("1/2/2007", "2/2/2007"))

#Graphics device is a png file of width 480 pixels and height 480 pixels
png("plot1.png",width=480,height=480)

hist(elecpowerconsum_feb$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

#now close the device
dev.off()

#Download the data into a working directory. Extract it. The file is not loaded to github as it is quite large

#Load dependent libraries
library(dplyr)

#Download the file and load using read.csv. Separattor in the file is ";". Missing values in the data are coded as "?". 
elecpowerconsum <- read.csv("../household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

#Wrap the local data frame using tbl_df. Helps with printing
elecpowerconsum_tbl <- tbl_df(elecpowerconsum)

#Goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007. Filter the dataset
elecpowerconsum_feb <- filter(elecpowerconsum_tbl, Date %in% c("1/2/2007", "2/2/2007"))

#Convert the Date and Time variables to Date/Time classes in R using the strptime()
elecpowerconsum_feb$DateTime <- strptime(paste(elecpowerconsum_feb$Date, elecpowerconsum_feb$Time), "%d/%m/%Y %H:%M:%S")

#Graphics device is a png file of width 480 pixels and height 480 pixels
png("plot2.png",width=480,height=480)

#Draw a line chart
plot(elecpowerconsum_feb$DateTime, elecpowerconsum_feb$Global_active_power, type="l", ylab="Global Active Power (kilowatts)",xlab=NA)

#now close the device
dev.off()

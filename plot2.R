## First check whether it has the file in the current dir.
if (!"load_data.R" %in% list.files()) {
    setwd("~/Desktop/Online Coursera/Coursera-Exploratory-Data-Analysis/ExData_Plotting1/")
} 
source("load_data.R")
png(filename = "plot2.png", 
     width = 480, height = 480,
     units = "px", bg = "transparent")
plot(DateTime, Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()

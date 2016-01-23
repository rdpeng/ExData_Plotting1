# INSTALLATION OF PACKAGES
install.packages("data.table")
library(data.table)
install.packages("dplyr")
library(dplyr)

# LOADING OF DATA
mydata<-fread("household_power_consumption.txt")
selectData<-
    mydata%>%
    filter(Date=="1/2/2007" | Date=="2/2/2007")

datetime <- strptime(paste(selectData$Date, selectData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# PLOTTING OF CHART
png(filename = "plot2.png", 
    width = 480, height = 480)

plot(
    datetime,
    as.numeric(selectData$Global_active_power), 
    type="l",
    xlab="",
    ylab = "Global Active Power (kilowatts)"
)

dev.off()
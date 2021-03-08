insert.packages("data.table")
install.packages("data.table")  
library(data.table)
install.packages("dplyr")
library(dplyr)
install.packages("lubridate")
library(lubridate)

# read data for the one month interval needed 


dataset <- data.table::fread("C://Users/maure/AppData/Local/Temp/
Temp1_exdata_data_household_power_consumption(2).zip/household_power_consumption.txt", 
header = TRUE, sep=';', na.strings = "?") 

# to get rows for the date we are interested in
dataset <- dataset %>% slice(66637:69516)

#combine date and time columns
dataset <- dataset %>% unite(DateTime, c("Date", "Time"))

#Create new DateTime vector with Date class with lubridate
format <- dmy_hms(dataset$DateTime)

#replace DateTime col with format
dataset$DateTime <- format

#make plot 1 and #save to png file 
png(filename = "plot1.png", width = 480, height = 480)
hist(dataset$Global_active_power, col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()

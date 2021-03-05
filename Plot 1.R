insert.packages("data.table")
install.packages("data.table")  
library(data.table)
install.packages("dplyr")
library(dplyr)
install.packages("lubridate")
library(lubridate)

# read data for the one month interval needed 
#(from 1/02/2007 - 02/02/2007)C:\Users\maure\AppData\Local\Temp\Temp1_exdata_data_household_power_consumption(2).zip\household_power_consumption.txt
dataset <- read.table("C:/Users/maure/AppData/Local/Temp/
                      Temp1_exdata_data_household_power_consumption(2).zip/
                      household_power_consumption.txt", skip = 66637, 
                      nrows = 2880, header = F, sep = ";", na.strings = c("?"),
                      comment.char = "")
#dataset <- data.table::fread("C://Users/maure/AppData/Local/Temp/Temp1_exdata_data_household_power_consumption(2).zip/household_power_consumption.txt", header = TRUE, sep=';') This worked
# to get rows for the date we are interested in
dataset <- dataset %>% slice(66637:69516)

#combine date and time columns
dataset <- dataset %>% unite(DateTime, c("Date", "Time"))
#Create new DateTime vector with Date class with lubridate
format <- dmy_hms(dataset$DateTime)
#replace DateTime col with format
dataset$DateTime <- format
#make plot 1
hist(dataset$Global_active_power, col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
#save to png file with dev.copy()
dev.copy(png, file = "plot1.png")
png 
4 

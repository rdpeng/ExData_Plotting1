#Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3
library(dplyr)

setwd("~/Coursera/Coursera/Course4/exdata_data_household_power_consumption")

power <- read.table("household_power_consumption.txt", sep=";",
                    col.names=c("Date","Time","Global_active_power",
                    "Global_reactive_power","Voltage",
                    "Global_intensity","Sub_metering_1",
                    "Sub_metering_2","Sub_metering_3"))
head(strptime(x = power$Date, format="%d/%m/%Y"))
#figuring out the formatting to strip and reformat times
testdates <- power$Date[1:10]
testdates
test_timestripped <-strptime(testdates[2],format = "%d/%m/%Y")

power <- power %>%
  mutate(Date_POS = as.Date(strptime(Date, format = "%d/%m/%Y")))
#We will only be using data from the dates 2007-02-01 and 
#2007-02-02. One alternative is to read the data from 
#just those dates rather than reading in the entire dataset 
#and subsetting to those dates.
df <- power %>% 
  filter(Date_POS == "2007-02-01" | Date_POS == "2007-02-02")
#Our overall goal here is simply to examine how household
#energy usage varies over a 2-day period in February, 2007. 
#Your task is to reconstruct the following plots below, 
#all of which were constructed using the base plotting system.



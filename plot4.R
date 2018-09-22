# plot4.R Programming assignment for week 1 of coursera's Exploratory Data Analysis Course
#
# Uses the UCI HAR  “Individual household electric power consumption Data Set” to produce some quick and dirty plots
# More info on the variables can be found on the UCI website at the link below
# https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
# 
# 21/09/2018 by arbkz  

require(dplyr)
require(lubridate)

# Uncomment the section below to download the Data  --->

# dURL <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
#if (!file.exists('./sample_data/')) dir.create('./sample_data')
#setwd('./sample_data')
#download.file(dURL,'./power.zip', method = 'curl')
#unzip('./power.zip')
# --------------------------> Uncomment to here 

# Load the Data into a data table
hpcSource <- tbl_df(read.table('household_power_consumption.txt',sep = ';', header = T, stringsAsFactors = F, na.strings = '?'))

# Extract only the data for the 1'st and 2nd of Feb 2007, 
# merge the date and time columns into a new column 'datetime' of data type date and drop the source columns
# Finally reorder the table so datetime is the first column

hpc <- hpcSource %>% 
        filter (Date == '1/2/2007' | Date == '2/2/2007') %>%
            mutate(datetime = parse_date_time(paste(Date,Time), orders = 'dmyHMS'), Date = NULL, Time = NULL)  %>%
                select(datetime,Global_active_power:Sub_metering_3) 

# create png gfx device 
png('plot4.png', width = 480, height = 480)

# set up 2 x 2 panel   
par(mfrow = c(2,2))

#create plots
with(hpc, plot(datetime, Global_active_power, type='l',col='black',ylab = 'Global Active Power',xlab =''))

with(hpc, plot(datetime, Voltage, type = 'l', col = 'black'))

plot(hpc$datetime, hpc$Sub_metering_1, type ="n", xlab = "", ylab = "Energy sub metering")
with(hpc,points(datetime, Sub_metering_1, type='l',col='black'))
with(hpc,points(datetime, Sub_metering_2, type = 'l', col = "red"))
with(hpc, points(datetime, Sub_metering_3, type = 'l', col = "blue"))

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1, bty = 'n', cex = 0.8)

with(hpc, plot(datetime, Global_reactive_power, type ='l'))

dev.off()

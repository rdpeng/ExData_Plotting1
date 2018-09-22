# plot1.R Programming assignment for week 1 of coursera's Exploratory Data Analysis Course
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
png('plot1.png', width = 480, height = 480)

# create plots
with(hpc, hist(Global_active_power, main = "Global Active Power", xlab = 'Global Active Power (kilowatts)', col = 'Red'))

dev.off()

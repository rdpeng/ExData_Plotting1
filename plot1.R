#Coursera Course Project for Exploratory Data Analysis 20151007 - EL

# sessionInfo()
# R version 3.2.0 (2015-04-16)
# Platform: x86_64-w64-mingw32/x64 (64-bit)
# Running under: Windows 8 x64 (build 9200)
# 
# locale:
#   [1] LC_COLLATE=English_United States.1252  LC_CTYPE=English_United States.1252   
# [3] LC_MONETARY=English_United States.1252 LC_NUMERIC=C                          
# [5] LC_TIME=English_United States.1252    
# 
# attached base packages:
#   [1] stats     graphics  grDevices utils     datasets  methods   base     
# 
# other attached packages:
#   [1] XML_3.98-1.3  stringr_1.0.0 rvest_0.3.0   xml2_0.1.2   
# 
# loaded via a namespace (and not attached):
#   [1] httr_1.0.0    R6_2.1.1      magrittr_1.5  tools_3.2.0   Rcpp_0.12.1  
# [6] stringi_0.5-5



setwd("C:\\Users\\Eric\\Documents\\R\\Coursera\\exploratory data analysis")
list.files()
# [1] "household_power_consumption.txt"


dataset <- read.delim2("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F)

head(dataset)
# Date     Time Global_active_power Global_reactive_power Voltage
# 1 16/12/2006 17:24:00               4.216                 0.418 234.840
# 2 16/12/2006 17:25:00               5.360                 0.436 233.630
# 3 16/12/2006 17:26:00               5.374                 0.498 233.290
# 4 16/12/2006 17:27:00               5.388                 0.502 233.740
# 5 16/12/2006 17:28:00               3.666                 0.528 235.680
# 6 16/12/2006 17:29:00               3.520                 0.522 235.020
# Global_intensity Sub_metering_1 Sub_metering_2 Sub_metering_3
# 1           18.400          0.000          1.000         17.000
# 2           23.000          0.000          1.000         16.000
# 3           23.000          0.000          2.000         17.000
# 4           23.000          0.000          1.000         17.000
# 5           15.800          0.000          1.000         17.000
# 6           15.000          0.000          2.000         17.000

str(dataset)
# 'data.frame':	2075259 obs. of  9 variables:
#   $ Date                 : chr  "16/12/2006" "16/12/2006" "16/12/2006" "16/12/2006" ...
# $ Time                 : chr  "17:24:00" "17:25:00" "17:26:00" "17:27:00" ...
# $ Global_active_power  : chr  "4.216" "5.360" "5.374" "5.388" ...
# $ Global_reactive_power: chr  "0.418" "0.436" "0.498" "0.502" ...
# $ Voltage              : chr  "234.840" "233.630" "233.290" "233.740" ...
# $ Global_intensity     : chr  "18.400" "23.000" "23.000" "23.000" ...
# $ Sub_metering_1       : chr  "0.000" "0.000" "0.000" "0.000" ...
# $ Sub_metering_2       : chr  "1.000" "1.000" "2.000" "1.000" ...
# $ Sub_metering_3       : chr  "17.000" "16.000" "17.000" "17.000" ...

dataset$date <- as.Date(dataset$Date, "%d/%m/%Y") 
dataset_1 <- dataset[(dataset$date == '2007-02-01')|(dataset$date == '2007-02-02'),]

names(dataset_1)
# [1] "Time"                  "Global_active_power"   "Global_reactive_power"
# [4] "Voltage"               "Global_intensity"      "Sub_metering_1"       
# [7] "Sub_metering_2"        "Sub_metering_3"        "date"                 
# [10] "formatted_date"

dataset_1$Global_active_power <- as.numeric(dataset_1$Global_active_power)


png("Plot1.png")
hist(dataset_1$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")
dev.off()

list.files()
# [1] "household_power_consumption.txt" "Plot1.png" 

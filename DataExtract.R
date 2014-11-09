## download file and unzip dataset for subsequent plot1.R to plot4.R
FileURL <- "https://d396qusza40orc.cloudfront.net"
download.file(FileURL, destfile="exdata_data_household_power_consumption.zip", 
              method = "wget")
unzip("exdata_data_household_power_consumption.zip", overwrite = T)

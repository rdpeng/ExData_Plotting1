#-------------------------------
# Script for ExData - Project 1
# Name: Plot1.R
# Aunthor: Joaquín Soliño
#-------------------------------
# Description:
#
# This Script has 3 function
#  - download_unzip_data: downloads and unzip source from UCI repository to a 
# local folder "data". Also removes zip file
#  - load_prepare_data: read data from "data/household_power_consumption.txt" 
# transform date and time to proper types and returns a subset with the data 
# from the days: 2007/02/01 and 2007/02/02. This data frame is the input
# for the next function.
#  - create_plot1: function takes as parameter a data frame and creates a 
# plot with the proper specification of the project, named as plot1.png 
# with 480x480 pixel.  
#
# ------------------------------

download_unzip_data <- function() {
      # download file and store it in "data" folder
      source_URL <-
            "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
      download.file(source_URL,
                    "data/exdata_data_household_power_consumption.zip")
      print("Unzip file exdata_data_household_power_consumption.zip...")
      # Unzip compressed file
      unzip("data/exdata_data_household_power_consumption.zip", exdir = "data")
      print("Done!")
      print("Removing file exdata_data_household_power_consumption.zip...")
      # Remove compressed file
      file.remove("data/exdata_data_household_power_consumption.zip")
      print("Done!")
}

load_prepare_data <- function() {
      # Read data from file
      data <-
            read.table(
                  "data/household_power_consumption.txt",
                  header = TRUE,
                  sep = ";",
                  na.strings = "?"
            )
      # Select data within the dates for the plots 
      data <- data[grep("^[12]/2/2007",data$Date),]
      # Convert Date and Time to proper format.
      data <- transform(data,
                        Time = strptime(
                              paste(data$Date, data$Time, sep = " "), 
                              format = "%d/%m/%Y %H:%M:%S")
      )
      data <- transform(data, Date = as.Date(data$Date,format = "%d/%m/%Y"))
}

create_plot1 <- function(data) {
      # Open PNG devide
      png(filename = "plot1.png", width = 480, height = 480, units = "px")
      # Plot 1 - Histogram      
      hist(
            data$Global_active_power,
            col = "red",
            xlab = "Global Active Power (kilowatts)",
            main = "Global Active Power"
      )
      # Close device - store plot
      dev.off()
      print("Plot 1 stored with name plot1.png")
}


# Usage: 
# Step 1 - download and unzip data. 

# download_unzip_data() # uncomment this line to execute

# Step 2 - Read data, transform date and time and returns subset for specific 
# data 1/2/2007 and 2/2/2007

# my_data <- load_prepare_data() # uncomment this line to execute

# Step 3 - Create a plot with the data frame result from Step2 and store in plot1.png

# create_plot1(my_data) # uncomment this line to execute
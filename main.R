
if (!require("data.table")) {
        install.packages("data.table")
}

# Load the dataset
data <- read.table("./Documents/R/Data/household_power_consumption.txt", sep=";", 
                   header=TRUE, na.strings = "?")

# Subsetting data by the dates from 2007-02-01 till 2007-02-02
data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

# convert the Date to Date class
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# convert the Time variable to Time class
data$Time <- strptime(paste(data$Date, data$Time), 
                               format="%Y-%m-%d %H:%M:%S")

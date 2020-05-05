# 01 - Set the working directory

# Set the working directory string, wd
wd <- "C:/Users/ac286705/OneDrive - GSK/Desktop/Andrea/online training/Coursera/20200405_ProjectAssignment_01"

# Set the working directory
setwd( wd )

# 02 - Load the data

# Set the file_name string
fileName <- "household_power_consumption.txt"

# Load data with read.table function:
electrPowCons <- read.table( file = fileName, 
                             header = TRUE, 
                             sep = ";", 
                             dec = ".",
                             na.strings = "?",
                             stringsAsFactors = FALSE )
#head( electrPowCons )

# 03 - Data conversions:

# paste date and time strings from the input dataframe:
dateTime <- paste ( electrPowCons$Date, electrPowCons$Time )

# conversion of column "time" to time class 
electrPowCons$Time <- as.POSIXct(dateTime, format = "%d/%m/%Y %H:%M:%S")

# 04 - Select dataset to be analyzed

# define the date min and max interval:
dateMin <- as.POSIXct ("2007-02-01 00:00:00")
dateMax <- as.POSIXct ("2007-02-03 00:00:00")

# define a boolean mask to select only entries within the date interval:
logi = (electrPowCons$Time >= dateMin) & 
  (electrPowCons$Time <= dateMax)

# define a new dataframe, df1, with the entries within the specified date interval:
df1 <- electrPowCons[logi, ]

# omit NAs in df1:
df1 <- na.omit(df1)

# Plot #1: Global Active Power

# Open the PNG file device: 
png( file = "plot1.png",
     width = 480, height = 480 )

# Adjust margins for plotting:
par(mar = c(4, 4, 2, 2))

# Plot the histogram:
with( df1, hist( Global_active_power,
                 main = "Global active power", # Histogram title
                 xlab = "Global Active Power (kilowatts)", #X-label
                 ylab = "Frequency", # Y-label
                 col = "red" ) ) # bar color

# Close the device:
dev.off()
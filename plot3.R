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

# Plot #3: Sub metering Energy vs. selected Days

# Open the PNG file device:
png( file = "plot3.png",
     width = 480, height = 480 )

# Create an empty plotting region where lines are added afterwards:
plot ( x = df1$Time, 
       y = df1$Sub_metering_1, 
       type="n",
       xlab = "",
       ylab = " Energy sub metering") 

# Add line plot for the SUb_metering_1 variable:
lines ( x = df1$Time,
        y = df1$Sub_metering_1, 
        col = "black",
        lty = 1 )

# Add line plot for the SUb_metering_2 variable:
lines ( x = df1$Time,
        y = df1$Sub_metering_2, 
        col = "red",
        lty = 1 )

# Add line plot for the SUb_metering_3 variable:
lines ( x = df1$Time,
        y = df1$Sub_metering_3, 
        col = "blue",
        lty = 1 )

# Add the legend:
legend ( "topright",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty = c(1,1,1,1),
         col = c("black", "red", "blue"),
         cex = 0.75 )

# Close the device:
dev.off()
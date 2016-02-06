


#download data set
if (!file.exists("household power consumption.zip")) {
  fileURL <<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, "household power consumption.zip", method = "curl")
}
if(!file.exists("household power consumption")) {
  unzip("household power consumption.zip")
}

# Four panel plot
do.plot4 <- function(x) {
  par(mfrow=c(2, 2))
  with(x, {
    ### Subplot 1 (top left)
    # Almost the same as plot 1, but sneakily drops the "(kilowatts)" from the y-label (almost got me!).
    plot(datetime, Global_active_power, type="l", xlab="",
         ylab="Global Active Power")
    
    ### Subplot 2 (top right)
    plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
    
    ### Subplot 3 (bottom left)
    # Set up the canvas
    plot(datetime, Sub_metering_1, type="n", xlab="",
         ylab="Energy sub metering")
    
    colors <- c("black", "red", "blue")
    # Set variables to Sub_metering_1, Sub..._2, ..._3
    variables <- paste("Sub_metering_", 1:3, sep="")
    
    # Loop from i = 1 to 3 and draw the lines each variable
    # (variables[i]) in the appropriate color (colors[i])
    for (i in seq_along(variables)) {
      var <- variables[i] ## Name of the variable we want as a string
      # Use double bracket notation to extract an entire column from
      # a data.frame by a name stored as in a string
      data <- x[[var]]
      lines(datetime, data, col=colors[i])
    }
    
    legend("topright",
           bty="n", ## Disable legend border (box type)
           legend=variables,
           col=colors, ## Set colors explicitly
           lty="solid" ## Draw solid lines next to each entry
    )
    
    ### Subplot 4 (bottom right)
    plot(datetime, Global_reactive_power, type="l")
    
  }) # end of with() block
}



# Four panel plot
do.plot4 <- function(x) {
  par(mfrow=c(2, 2))
  with(x, {
    ### Subplot 1 (top left)
    # Almost the same as plot 1, but sneakily drops the "(kilowatts)" from the y-label (almost got me!).
    plot(datetime, Global_active_power, type="l", xlab="",
         ylab="Global Active Power")
    
    ### Subplot 2 (top right)
    plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
    
    ### Subplot 3 (bottom left)
    # Set up the canvas
    plot(datetime, Sub_metering_1, type="n", xlab="",
         ylab="Energy sub metering")
    
    colors <- c("black", "red", "blue")
    # Set variables to Sub_metering_1, Sub..._2, ..._3
    variables <- paste("Sub_metering_", 1:3, sep="")
    
    # Loop from i = 1 to 3 and draw the lines each variable (variables[i]) in the appropriate color (colors[i])
    for (i in seq_along(variables)) {
      var <- variables[i] ## Name of the variable we want as a string
      # Use double bracket notation to extract an entire column from a data.frame by a name stored as in a string
      data <- x[[var]]
      lines(datetime, data, col=colors[i])
    }
    
    legend("topright",
           bty="n", ## Disable legend border (box type)
           legend=variables,
           col=colors, ## Set colors explicitly
           lty="solid" ## Draw solid lines next to each entry
    )
    
    ### Subplot 4 (bottom right)
    plot(datetime, Global_reactive_power, type="l")
    
  }) # end of with() block
}

# Load and filter household power consumption dataset
load.power.data <- function(filepath) {
  # Just read the whole thing
  x <- read.table(filepath, sep=";", header=TRUE, na.strings="?")
  
  # Create a new "datetime" column with type POSIXlt by combining the existing Date and Time columns
  x$datetime <- strptime(paste(x$Date, x$Time), "%d/%m/%Y %H:%M:%S")
  
  # Return only the subset of dates we are interested in as given in the assignment description
  dates <- c(as.Date("2007-02-01"), as.Date("2007-02-02"))
  x[as.Date(x$datetime) %in% dates,]
}


# Four panel plot
do.plot4 <- function(x) {
  par(mfrow=c(2, 2))
  with(x, {
    ### Subplot 1 (top left)
    # Almost the same as plot 1, but sneakily drops the "(kilowatts)" from the y-label (almost got me!).
    plot(datetime, Global_active_power, type="l", xlab="",
         ylab="Global Active Power")
    
    ### Subplot 2 (top right)
    plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
    
    ### Subplot 3 (bottom left)
    # Set up the canvas
    plot(datetime, Sub_metering_1, type="n", xlab="",
         ylab="Energy sub metering")
    
    colors <- c("black", "red", "blue")
    # Set variables to Sub_metering_1, Sub..._2, ..._3
    variables <- paste("Sub_metering_", 1:3, sep="")
    
    # Loop from i = 1 to 3 and draw the lines each variable
    # (variables[i]) in the appropriate color (colors[i])
    for (i in seq_along(variables)) {
      var <- variables[i] ## Name of the variable we want as a string
      # Use double bracket notation to extract an entire column from
      # a data.frame by a name stored as in a string
      data <- x[[var]]
      lines(datetime, data, col=colors[i])
    }
    
    legend("topright",
           bty="n", ## Disable legend border (box type)
           legend=variables,
           col=colors, ## Set colors explicitly
           lty="solid" ## Draw solid lines next to each entry
    )
    
    ### Subplot 4 (bottom right)
    plot(datetime, Global_reactive_power, type="l")
    
  }) # end of with() block
}

x <- load.power.data("./household_power_consumption.txt")

png("plot42.png", width=480, height=480, bg=bg.color)
do.plot4(x)
dev.off()
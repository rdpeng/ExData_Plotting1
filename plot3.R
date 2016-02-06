
# Line plot of Sub_metetering_{1,2,3} in {black,red,blue} with no x-label or title, explicit y-label, and a legend using colored lines of type 1.
do.plot3 <- function(x) {
  with(x, {
    # Set up the canvas
    plot(datetime, Sub_metering_1, type="n", xlab="",
         ylab="Energy sub metering")
    
    
    colors <- c("black", "red", "blue")
    # Set variables to Sub_metering_1, Sub..._2, ..._3
    variables <- paste0("Sub_metering_", 1:3)
    
    # Loop from i = 1 to 3 and draw the lines each variable (variables[i]) in the appropriate color (colors[i])
    for (i in seq_along(variables)) {
      var <- variables[i] ## Name of the variable we want as a string
      # Use double bracket notation to extract an entire column from a data.frame by a name stored in a string
      data <- x[[var]]
      lines(datetime, data, col=colors[i])
    }
    
    legend("topright",
           legend=variables, ## Names of items in legend
           col=colors, ## Set colors explicitly
           lty="solid" ## Draw solid lines next to each entry
    )
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


# Line plot of Sub_metetering_{1,2,3} in {black,red,blue} with no x-label or title, explicit y-label, and a legend using colored lines of type 1.
do.plot3 <- function(x) {
  with(x, {
    # Set up the canvas
    plot(datetime, Sub_metering_1, type="n", xlab="",
         ylab="Energy sub metering")
    
    
    colors <- c("black", "red", "blue")
    # Set variables to Sub_metering_1, Sub..._2, ..._3
    variables <- paste0("Sub_metering_", 1:3)
    
    # Loop from i = 1 to 3 and draw the lines each variable (variables[i]) in the appropriate color (colors[i])
    for (i in seq_along(variables)) {
      var <- variables[i] ## Name of the variable we want as a string
      # Use double bracket notation to extract an entire column from a data.frame by a name stored in a string
      data <- x[[var]]
      lines(datetime, data, col=colors[i])
    }
    
    legend("topright",
           legend=variables, ## Names of items in legend
           col=colors, ## Set colors explicitly
           lty="solid" ## Draw solid lines next to each entry
    )
  }) # end of with() block
}

x <- load.power.data("./household_power_consumption.txt")

png("plot3.png", width=480, height=480, bg=bg.color)
do.plot3(x)
dev.off()
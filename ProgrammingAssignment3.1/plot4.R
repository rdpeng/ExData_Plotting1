plot4 <- function ()
{
  ## Reading the data for plotting
  dataPath <- paste(getwd(), 
                    "/ProgrammingAssignment3.1/household_power_consumption.txt", 
                    sep = "")
  DT <- read.table(dataPath, header = TRUE, sep=";", 
                   nrows = 100000, as.is="Global_active_power")
  
  ## Filtering the read data to keep just two dates
  dates <- as.Date(c("2007-02-01","2007-02-02"))
  data <- DT[as.Date(DT$Date, "%d/%m/%Y") %in% dates, ]
  
  ## Merging the Date and Time into a new column
  data[,"DateTime"] <- as.POSIXct(paste(data$Date, data$Time), 
                                  format="%d/%m/%Y %H:%M:%S")
  
  ## Creation of the png image with the plot() function
  pngPath <- paste(getwd(),
                   "/ProgrammingAssignment3.1/plot4.png", 
                   sep = "")
  png(filename=pngPath, width = 480, height = 480)
  par(mfrow = c(2, 2))
  with(data, {
    ## PLOT 1
    plot(DateTime, 
         as.numeric(Global_active_power), xlab = "",
         ylab = "Global Active Power",type = "l")
    ## PLOT 2
    plot(DateTime, 
         Voltage, xlab = "datetime",
         ylab = "Voltage", type = "l")
    ## PLOT 3
    plot(DateTime, Sub_metering_1, xlab = "",
         ylab = "Energy sub metering", type = "l",
                  col = "black")
    lines(DateTime, Sub_metering_2, col = "red")
    lines(DateTime, Sub_metering_3, col = "blue")
    legend("topright",c("Sub_metering_1",
                        "Sub_metering_2",
                        "Sub_metering_3"),
           col=c("black","red","blue"),lty=c(1,1,1))
    ## PLOT 4
    plot(DateTime, 
         Global_reactive_power, xlab = "datetime",
         ylab = "Global_reactive_power", type = "l")
    
  })
  dev.off()  
  
}
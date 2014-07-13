plot2 <- function ()
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
  
  ## Creation of the png image with the hist() function
  pngPath <- paste(getwd(),
                   "/ProgrammingAssignment3.1/plot2.png", 
                   sep = "")
  png(filename=pngPath,width = 480, height = 480)  
  with(data, plot(DateTime, 
                  as.numeric(Global_active_power),
                  xlab = "",
                  ylab = "Global Active Power (kilowatts)",
                  type = "l"))
  dev.off()  
  
}
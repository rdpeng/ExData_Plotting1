plot1 <- function ()
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
  
  ## Creation of the png image with the hist() function
  pngPath <- paste(getwd(),
                   "/ProgrammingAssignment3.1/plot1.png", 
                   sep = "")
  png(filename=pngPath,width = 480, height = 480)  
  hist(as.numeric(data$Global_active_power), 
       main = "Global Active Power", col = "red", 
       xlab = "Global Active Power (kilowatts)",
       ylab = "Frequency")
  dev.off()  
  
}
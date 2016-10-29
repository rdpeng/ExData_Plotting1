# This file contais a function that reads
# Electric Power Consuption source data
# and returns just the data set used in
# plot1, plot2, plot3 and plot4

readElectricPowerData <- function(){
  # setting the direcgtory where source data file is located
  sourceDir <- "/Users/EduardoAndrade/DataScienceSpecialization_Data"
  sourceFile <- paste(sourceDir, "household_power_consumption.txt", sep = "/")
  
  ecpData <- read.table(sourceFile,
                        header = TRUE,
                        sep = ";",
                        stringsAsFactors = FALSE)
  
  ecpTargetData <- subset(ecpData, Date == "1/2/2007" | Date == "2/2/2007")
  
  # convert from charqcter to numeric
  ecpTargetData$Global_active_power <- as.numeric(ecpTargetData$Global_active_power)
  ecpTargetData$Sub_metering_1 <- as.numeric(ecpTargetData$Sub_metering_1)
  ecpTargetData$Sub_metering_2 <- as.numeric(ecpTargetData$Sub_metering_2)
  ecpTargetData$Sub_metering_3 <- as.numeric(ecpTargetData$Sub_metering_3)
  ecpTargetData$Voltage <- as.numeric(ecpTargetData$Voltage)
  ecpTargetData$Global_reactive_power <- as.numeric(ecpTargetData$Global_reactive_power)
  
  #creating a new column of date and time with class POSIXct
  ecpTargetData["DateTime"] <- as.POSIXct(paste(ecpTargetData[,1],
                                             ecpTargetData[,2], sep = " "),
                                       format = "%d/%m/%Y %H:%M:%S")
  
  # checking data set details
  #head(ecpTargetData)
  #str(ecpTargetData)
  #View(ecpTargetData)
  
  rm(ecpData) #freeing up memory
  
  ecpTargetData #returning target data set
}
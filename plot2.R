# plot2.R
# Goal:
# -> draw a line plot of Global Active Power by time of measurement
# -> Draw the plot and save it to a PNG file named plot2.png with a 
#    width of 480 pixels and a height of 480 pixels

#cleaning memory up
rm(list = ls())


plot2 <- function(targetData){
  
  par(cex = 0.75)
  
  plot(unclass(targetData$DateTime),
       targetData$Global_active_power/500,
       type = "l",
       ylab = "Global Activy Power (kilowatts)",
       xlab = "",
       xaxt = "n",
       yaxt = "n",
       axes = TRUE)
  
  #drawing the axes of the plot
  minDate <- min(unclass(targetData$DateTime))
  maxDate <- max(unclass(targetData$DateTime))
  
  axis(1,
       seq (minDate, maxDate, by = (maxDate - minDate)/2),
       labels = c("Thu", "Fri", "Sat")
  )
  
  axis (2, seq(0,
               max(targetData$Global_active_power)/500*0.75,
               by = max(targetData$Global_active_power)/500/3*0.75),
        seq (0, 6, by = 2))
  
}

# Function that reads
# Electric Power Consuption source data
# and returns just the data set used in plot2
readElectricPowerData <- function(sourceDir){
  
  sourceFile <- paste(sourceDir, "household_power_consumption.txt", sep = "/")
  
  ecpData <- read.table(sourceFile,
                        header = TRUE,
                        sep = ";",
                        stringsAsFactors = FALSE)
  
  ecpTargetData <- subset(ecpData, Date == "1/2/2007" | Date == "2/2/2007")
  
  # convert from charqcter to numeric
  ecpTargetData$Global_active_power <- as.numeric(ecpTargetData$Global_active_power)

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

# setting the directory where source data file is located
sourceDir <- "/Users/EduardoAndrade/DataScienceSpecialization_Data"
# reading data from source file
ecpTargetData <- readElectricPowerData(sourceDir)

png(filename = "plot2.png", width = 480, height = 480)
plot2(ecpTargetData)
dev.off()

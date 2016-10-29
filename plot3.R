# plot3.R
# Goal:
# -> draw a line plot of Energy Sub Meterings by datetime
# -> save the plotting to a PNG file named plot2.png
# ->   width of 480 pixels and a height of 480 pixels

#cleaning memory up
rm(list = ls())

plot3 <- function(targetData){
  par(cex = 0.75)
  
  plot(unclass(targetData$DateTime),
       targetData$Sub_metering_1,
       ylim = range(targetData$Sub_metering_1),
       col = "black",
       type = "n",
       ylab = "Energy sub metering",
       xlab = "",
       xaxt = "n",
       yaxt = "n",
       axes = TRUE)
  
  lines(unclass(targetData$DateTime), targetData$Sub_metering_1, col = "black")
  lines(unclass(targetData$DateTime), targetData$Sub_metering_2, col = "red")
  lines(unclass(targetData$DateTime), targetData$Sub_metering_3, col = "blue")
  
  
  #drawing the axes of the plot
  minDate <- min(unclass(ecpTargetData$DateTime))
  maxDate <- max(unclass(ecpTargetData$DateTime))
  axis(1,
       seq (minDate, maxDate, by = (maxDate - minDate)/2),
       labels = c("Thu", "Fri", "Sat")
  )
  
  axis (2, seq(0,
               max(targetData$Sub_metering_1)*0.75,
               by = max(targetData$Sub_metering_1)/3*0.75),
        seq (0, 30, by = 10))
  
  legend(x = "topright",
         lty=c(1,1),
         legend = c("Sub_metering_1",
                    "Sub_metering_2",
                    "Sub_metering_3"),
         col = c("black", "red", "blue"))
  }

# Function that reads
# Electric Power Consuption source data
# and returns just the data set used in plot3

readElectricPowerData <- function(sourceDir){
  # setting the direcgtory where source data file is located
  sourceFile <- paste(sourceDir, "household_power_consumption.txt", sep = "/")
  
  ecpData <- read.table(sourceFile,
                        header = TRUE,
                        sep = ";",
                        stringsAsFactors = FALSE,
                        na.strings = c("?"))
  
  ecpTargetData <- subset(ecpData, Date == "1/2/2007" | Date == "2/2/2007")
  
  # convert from charqcter to numeric
  ecpTargetData$Sub_metering_1 <- as.numeric(ecpTargetData$Sub_metering_1)
  ecpTargetData$Sub_metering_2 <- as.numeric(ecpTargetData$Sub_metering_2)
  ecpTargetData$Sub_metering_3 <- as.numeric(ecpTargetData$Sub_metering_3)
  
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

# setting the directory where "household_power_consumption.txt" file is located
# while testing the code, please set this folder according to where
# "household_power_consumption.txt" is located
sourceDir <- getwd()
ecpTargetData <- readElectricPowerData(sourceDir)

png(filename = "plot3.png", width = 480, height = 480)

plot3(ecpTargetData)

dev.off()

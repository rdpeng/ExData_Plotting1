# plot2.R
# Goal:
# -> draw the following four plots in just one canvas:
#    - 
# -> Draw the plot and save it to a PNG file named plot2.png with a 
#    width of 480 pixels and a height of 480 pixels

#cleaning memory up
rm(list = ls())

plot4 <- function(targetData){
  
  # scaling font to 75% of default size and dividing canvas on 4 parts
  par(cex = 0.75, mfcol = c(2,2))
  
  plotGlobalActivePower(targetData)
  plotSubMetering(targetData)
  plotVoltage(targetData)
  plotGlobalReactivePower(targetData)
  
}

plotSubMetering <- function(targetData){
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
         col = c("black", "red", "blue"),
         bty = "n")
  
}

plotGlobalActivePower <- function(targetData){
  maxValue <- max(targetData$Global_active_power)
  
  
  plot(unclass(targetData$DateTime),
       targetData$Global_active_power/500,
       type = "l",
       ylab = "Global Active Power",
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


plotVoltage <- function(targetData){
  maxValue <- max(targetData$Voltage)
  plot(unclass(targetData$DateTime),
       targetData$Voltage,
       type = "l",
       ylab = "Voltage",
       xlab = "datetime",
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
  axis (2, seq(234, 246, by = 4), seq(234, 246, by = 4))
}

plotGlobalReactivePower <- function(targetData){
  maxValue <- max(targetData$Global_reactive_power)
  plot(unclass(targetData$DateTime),
       targetData$Global_reactive_power,
       type = "l",
       ylab = "Global_reactive_power",
       xlab = "datetime",
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
  axis (2, seq(0.0, 0.5, by = 0.1), c("0.0", "0.1" , "0.2", "0.3", "0.4", "0.5" ))
}

# Function that reads
# Electric Power Consuption source data
# and returns just the data set used in plot4
readElectricPowerData <- function(sourceDir){
  
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

# setting the direcgtory where source data file is located
sourceDir <- "/Users/EduardoAndrade/DataScienceSpecialization_Data"
# loading data from source
ecpTargetData <- readElectricPowerData(sourceDir)

png(filename = "plot4.png", width = 480, height = 480)

plot4(ecpTargetData)

dev.off()






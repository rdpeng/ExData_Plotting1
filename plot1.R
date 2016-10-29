# plot1.R
# Goal:
# -> draw a histogram of Global Active Power
# -> Draw the plot and save it to a PNG file named plot1.png with a 
#    width of 480 pixels and a height of 480 pixels

#cleaning memory up
rm(list = ls())

# function that receives cleaned data and plot the graph
plot1 <- function(targetData){
  
  maxValue <- max(targetData$Global_active_power)
  
  par(cex = 0.75) # scaling font size for label to fit y axis
  
  # to scale the size to be according to the exercise, global activity power
  # shall be devided by 500
  hist(targetData$Global_active_power,
       xlab = "Global Active Power (kilowatts)",
       xlim = c(0, maxValue),
       col = "red",
       main = "Global Active Power",
       axes = TRUE,
       breaks = seq(0, 7.5, by = 0.5)
  )
}

# Function that reads
# Electric Power Consuption source data
# and returns just the data set used in plot1
readElectricPowerData <- function(sourceDir){
  
  sourceFile <- paste(sourceDir, "household_power_consumption.txt", sep = "/")
  
  # reads data preserving numeric values as is
  ecpData <- read.table(sourceFile,
                        header = TRUE,
                        sep = ";",
                        stringsAsFactors = FALSE)
  
  ecpTargetData <- subset(ecpData, Date == "1/2/2007" | Date == "2/2/2007")
  
  # convert from charqcter to numeric
  ecpTargetData$Global_active_power <- as.numeric(ecpTargetData$Global_active_power)
  
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

# plot1.png will be stored in the working directory
png(filename = "plot1.png", width = 480, height = 480)
plot1(ecpTargetData)
dev.off()

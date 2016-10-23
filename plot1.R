# plot1.R
# Goal:
# -> draw a histograma of Frequency by Global Active Power
# -> Construct the plot and save it to a PNG file with a 
#    width of 480 pixels and a height of 480 pixels

rm(list = ls()) #cleaning memory

# setting working dir to where source data file is located
setwd("/Users/EduardoAndrade/DataScienceSpecialization_Data")

ecpData <- read.table("household_power_consumption.txt",
                         header = TRUE, sep = ";")

ecpTargetData <- subset(ecpData, Date == "1/2/2007" | Date == "2/2/2007")

# checking data set details
#head(ecpTargetData)
#str(ecpTargetData)
#View(ecpTargetData)

rm(ecpData) #freeing up memory

# converting from character to numeric
ecpTargetData$Global_active_power <- as.numeric(ecpTargetData$Global_active_power)

maxValue <- max(ecpTargetData$Global_active_power)

png(filename = "plot1.png", width = 480, height = 480)

par(cex = 0.75) # scaling font size for label to fit y axis

# scaling the size to be according to the exercise, global activity power
# shall be devided by 500
hist(ecpTargetData$Global_active_power/500,
     xlab = "Global Active Power (kilowatts)",
     xlim = c(0, maxValue/500),
     col = "red",
     main = "Global Active Power",
     axes = TRUE,
     breaks = seq(0,
                  maxValue / 500,
                  by = maxValue / 500 / 15)
     )

dev.off()

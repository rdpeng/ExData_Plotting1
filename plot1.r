getwd()
setwd("C:/R/Coursera/04_ExploratoryAnalysis/Week1")
library(dplyr)

### Data Extraction
HPC <- read.table("C:/R/Coursera/04_ExploratoryAnalysis/Week1/household_power_consumption.txt",
                sep = ";", header = TRUE)

## Filter data to two days in February
HPC1 <- HPC %>% filter (Date == "1/2/2007"| Date == "2/2/2007")

## Convert global active power to numeric
HPC1$Global_active_power <- as.numeric(HPC1$Global_active_power)
hist(HPC1$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red",
     main = "Global Active Power")

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()

?dev.copy

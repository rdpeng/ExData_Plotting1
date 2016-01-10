#Setting workspace
setwd("D://workspaceR/Exploratory Data Analysis/Project 1/")
getwd()

#Reading days from February 2007
file <- file("household_power_consumption.txt")
df <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE, dec = ".")
data <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

#Erasing full data to free memory
rm(df)

#construct the plot
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#copy graph to PNG file
dev.copy(device = png, file="plot1.png", height=480, width=480)
dev.off()



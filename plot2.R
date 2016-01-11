#Setting workspace
setwd("D://workspaceR/Exploratory Data Analysis/Project 1/")
getwd()

#Change language default
Sys.setenv("LANGUAGE"="En")
Sys.setlocale("LC_ALL", "English")

#Reading days from February 2007
file <- file("household_power_consumption.txt")
df <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE, dec = ".")
data <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

#Erasing full data to free memory
rm(df)

#construct the plot
#adjusting axes scale
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(datetime, data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

#copy graph to PNG file
dev.copy(device = png, file="plot2.png", height=480, width=480)
dev.off()



###############################################
##  Downloading, Unzipping and reading data  ##
###############################################

uRL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(url = uRL, destfile = temp, mode = "wb")
fileName <- "household_power_consumption.txt"
unzip(temp, fileName)
df1 <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
head(df1)
unlink(temp)

##########################
##  Data preprocessing  ##
##########################

df2 <- df1
str(df2)
df2$Date <- as.Date(x = df2$Date, format = "%d/%m/%Y")
df2$Time <- format(x = df2$Time, format = "%H:%M:%S")
df2$DateTime <- as.POSIXct(paste(df2$Date, df2$Time), format="%Y-%m-%d %H:%M:%S")
head(df2)

library(dplyr)
df3 <- filter(df2, Date == "2007-02-01" | Date == "2007-02-02")
head(df3)

#############
##  plot1  ##
#############

png(filename = "plot1.png", width = 480, height = 480, units = "px")
plot1 <- hist(x = df3$Global_active_power,
               main = "Global Active Power",
               xlab = "Global Active Power (kilowatts)",
               ylab = "Frequency",
               col = "red")
dev.off()


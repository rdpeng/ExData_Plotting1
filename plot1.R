##change directory to assignment1 in data exploration file
##this is where I saved data file. 

data1 <- read.csv("household_power_consumption.csv")
head(data1)

##We are only interested in data for 2/1/2007 and 2/2/2007
data2 <- data1[(data1$Date == "1/2/2007" | data1$Date == "2/2/2007"),]
head(data2)

##first graph is histogram of Global_active_power.
##(data2$Global_active_power) is a factor, first turn into numeric then hist. 
data2_char <- as.character(data2$Global_active_power)
data2_num <- as.numeric(data2_char)
hist(data2_num)

##histograph matches the one in assignment, now add the details.
hist(data2_num, col = "red", main = paste("Global Active Power"), 
xlab = "Global Active Power (kilowatts)")

##plot is now on screen so can save out.
dev.copy(png, file = "plot1.png", width = 480)
dev.off()
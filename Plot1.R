rm(list=ls()) # clear environment
set.seed(6583) # setting seed for reproducibility, in case of random number gen.

HEC <- read.csv("D:/Coursera/ExData_Plotting1/WorkingData/power_consumption_2_day.csv", header = TRUE)

summary(HEC) # No missing values found, 0's assumed to be correct values
View(HEC) # displays the first 1000 rows


HEC$Date <- as.Date(HEC$Date, "%d/%m/%Y") #convert to standard date format
str(HEC$Date)  # view variable characteristics
wkday <- wday(HEC$Date, label = TRUE, abbr=TRUE) # To extract weekday
HEC$Time <- hms(HEC$Time)
str(HEC$Time)

par(mfrow = c(1,1))
hist(HEC$Global_active_power, col='Red',xlim = c(0,6), ylim=c(0,1200), breaks=12, xaxp=c(0,6,3)
      ,xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main="Global Active Power")

#copy the png file to working directory
dev.copy(png, file="Plot1.png", width=480, height=480)
dev.off()

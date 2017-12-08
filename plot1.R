#Getting data

setwd("C:/Users/accou/Desktop/ks/COURSERA/Exploratory Data Analysis/data")
#Plot 1:

#reading data

data_file<- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")

data_file$Date<- as.Date(data_file$Date, format="%d/%m/%Y")

#subsetting data

data_subset<- subset(data_file, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#converting date and time

date_time <- paste(as.Date(data_subset$Date), data_subset$Time)

data_subset$Datetime<- as.POSIXct(date_time)

#plotting histogram

hist(data_subset$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#saving .png file

dev.copy(png, file="plot1.png", height=480, width=480)

dev.off()
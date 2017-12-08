#Plot 2:

#reading data

data_file<- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")

data_file$Date<- as.Date(data_file$Date, format="%d/%m/%Y")

#subsetting data

data_subset<- subset(data_file, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#converting date and time

date_time <- paste(as.Date(data_subset$Date), data_subset$Time)

data_subset$Datetime<- as.POSIXct(date_time)


#plotting base plot

plot(data_subset$Global_active_power~data_subset$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")


#saving .png file

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
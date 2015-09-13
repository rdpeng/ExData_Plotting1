mydata = read.csv("household_power_consumption_feb1and2.csv") # load in csv
#Do first plot
png('plot1.png')
hist(mydata$Global_active_power, breaks = 12 , 
	col="red", xlab= "Global Active Power (kilowatts)",
	main = "Global Active Power")
dev.off()

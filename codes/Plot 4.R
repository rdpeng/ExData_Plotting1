
##Description of the dataset:

	#Measurements of electric power consumption in one household
	#with a one-minute sampling rate over a period of almost 4 years.
	#Different electrical quantities and some sub-metering values are available.

	datafile <- file("household_power_consumption.txt")

## Reading the household_power_consumption

	dataset <- read.csv(datafile, header = T, sep = ';', 
                      na.strings = "?")

	dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")

## Subsetting the data

	dt <- subset(dataset, subset = (Date == "2007-02-01" | Date == "2007-02-02"))


## Converting dates

	date <- paste(as.Date(dt$Date),dt$Time)
	dt$Date_Time <- as.POSIXct(date)

## Plot 4
	
	png(filename = "Plot 4.png",width = 480, height = 480)

		par(mfrow = c(2,2),mar = c(4,4,2,1), oma = c(0,0,2,0))

		with( dt , 

			{
		
			plot(Global_active_power ~ Date_Time, type = "l", 
				xlab = "" , ylab = "Global Active Power")
		
			plot(Voltage ~ Date_Time, type = "l", xlab = "datetime" , ylab = "Voltage")
		
			plot(Sub_metering_1 ~ Date_Time, type = "l", xlab = "" ,
				ylab = "Energy sub metering")
		
			lines(Sub_metering_2 ~ Date_Time, col = 'Red')
			
			lines(Sub_metering_3 ~ Date_Time, col = 'Blue')
				legend("topright", col = c("black", "red", "blue"), lty = "solid", 
				legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
		
			plot(Global_reactive_power ~ Date_Time, type = "l", 
				xlab = "datetime" , ylab = "Global_reactive_power")
		
			})

	dev.off()

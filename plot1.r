con<-"G:/Education/Coursera/DataScience-1/4 - Exploratory Data Analysis/Week 1/Assignment/household_power_consumption.txt"

tbl <- read.table(con, header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
	tbl <- tbl[(tbl$Date == "1/2/2007") | (tbl$Date == "2/2/2007"),]
	tbl$DateTime <- strptime(paste(tbl$Date, tbl$Time), "%d/%m/%Y %H:%M:%S")
	write.csv(tbl)

	png(filename = "plot1.png", width = 480, height = 480, units = "px")
	hist(tbl$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
	dev.off()

doPlot1()

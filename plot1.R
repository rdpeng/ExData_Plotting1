
mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y") # Date column is converted into date type

mysubset <- subset(mydata, Date>="2007-2-1" & Date <="2007-2-2") #subset for the specific period

mysubset$datatime <- paste(mysubset$Date,mysubset$Time)

mysubset$datatime <- strptime(mysubset$datatime, "%Y-%m-%d %H:%M:%S")

# Printing to PNG file

png(filename="plot1.png",height = 480,width = 480)
hist(mysubset$Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()
#in this, when I tried to subset the data BEFORE reading it in, I kept receiving the following error: Error in plot.window(...) : need finite 'xlim' values.
#reading the full data in first solved the problem but admittedly I don't know why I had infinite time values????
mydata <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=c(rep("character",2), rep("numeric",7)),na="?")

#also, I found out I didn't have to change the column names!  So I am keeping this format for the reast of my plots....

mydata$Time <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")
mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")
mydata <- subset(mydata, Date %in% as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d"))

png("plot2.png")

plot(mydata$Time, mydata$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()

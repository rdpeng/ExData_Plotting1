mydata <- read.table("household_power_consumption.txt",
                     header=TRUE,
                     sep=";",
                     colClasses=c(rep("character",2), rep("numeric",7)),
                     na="?")
mydata$Time <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")
mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")
mydata <- subset(mydata, Date %in% as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d"))
  
png("plot1.png")
  
hist(mydata$Global_active_power,
    main="Global Active Power",
    xlab="Global Active Power (kilowatts)",
    ylab="Frequency",
    col="red")

dev.off()

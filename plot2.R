


#read data from file
data <- read.table('household_power_consumption.txt', colClasses = c("character", "character",
                                                                     "numeric", "numeric", "numeric", "numeric", "factor", "factor", "factor"), header =TRUE, sep =';', na.strings="?")



#add dateTime column
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# subset the data we want
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data<-data[data$Date>="2007-02-01",]
data<-data[data$Date<="2007-02-02",]
head(data,3)




# create the png with with the matching labels and size

png(filename="plot2.png", width=480, height=480)

plot(data$DateTime, data$Global_active_power, xlab="",
     ylab="Global active power (kilowatts)", main="", type="n", mar=c(2,2,2,2))
lines(data$DateTime, data$Global_active_power)

dev.off()
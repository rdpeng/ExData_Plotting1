download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', 'household_power_consumption.zip')
unzip('household_power_consumption.zip')data<-household_power_consumption
data<-data[data$Date %in% c('1/2/2007', '2/2/2007'), ]


x <- paste(data$Date, data$Time)
x <-strptime(x, "%d/%m/%Y %H:%M:%S")

data$Time<-strptime(data$Time, "%H:%M:%S")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$Time2<-x

png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power,col="tomato", xlab= "Global Active Power (kilowatts)",main="Global Active Power")
dev.off()

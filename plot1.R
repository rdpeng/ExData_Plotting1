data<-read.csv("C:/Users/e99579/Desktop/household_power_consumption.txt", sep=";", 
               colClasses = c('character', 'character', 'numeric', 'numeric', 
                              'numeric', 'numeric', 'numeric', 'numeric', 'numeric'),
                              na.strings='?')
              
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data<-subset(data, as.Date(DateTime)>=as.Date("2007-02-01") &
                as.Date(DateTime)<= ("2007-02-02"))
png("plot1.png" , height = 480, width = 480)

hist(data$Global_active_power, col = 'red' , xlab = 'Global Active Power (kilowatts)',
     main = "Global Active Power")
dev.off()

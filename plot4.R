#Loading the dataset into R with '?' turning into NAs
electric_power_consumption<-read.table("./Downloads/household_power_consumption.txt",sep=";",na.strings=c("?",""),header=TRUE)

#Dates that we are interested in
dates=c("1/2/2007","2/2/2007")

#Subsetting the data to include just those dates
data<-electric_power_consumption[ electric_power_consumption$Date %in% dates, ]

#Combining the Date and time to create a DateTime variable
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

#This is to allow us to present 4 graphs and I played around with the margins but decided to keep
#them the same(figure it is good to keep it there if I refer to this program later and want to 
#change them to see how things look)
par(mfrow=c(2,2), mar=c(4,4,2,2))

#top left plot
plot(data$DateTime,data$Global_active_power, type='l', ylab='Global Active Power',xlab='' )

#top right plot
plot(data$DateTime,data$Voltage, type='l', ylab='Voltage', xlab='datetime' )

#bottom left plot where legend size has been reduced and the box that surrounds the 
#legend has been removed
plot(data$DateTime,data$Sub_metering_1, type='l', ylab='Energy sub metering',xlab='')
lines(data$DateTime,data$Sub_metering_2, type='l', col='red')
lines(data$DateTime,data$Sub_metering_3, type='l', col='blue')
legend("topright", pch='-', col=c('black','red','blue'), cex=0.5, bty='n',
       legend=c("Sub_metering_1          ",
                "Sub_metering_2          ",
                "Sub_metering_3          ") )

#bottom right plot
plot(data$DateTime,data$Global_reactive_power, type='l', ylab='Global_reactive_power', xlab='datetime')

#Copying the plot to a file plot4.png with 480 by 480 size
dev.copy(png,file="./plot4.png", width=480, height=480)
dev.off()
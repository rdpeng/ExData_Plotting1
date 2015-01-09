#Loading the dataset into R with '?' turning into NAs
electric_power_consumption<-read.table("./Downloads/household_power_consumption.txt",sep=";",na.strings=c("?",""),header=TRUE)

#Dates that we are interested in
dates=c("1/2/2007","2/2/2007")

#Subsetting the data to include just those dates
data<-electric_power_consumption[ electric_power_consumption$Date %in% dates, ]

#Combining the Date and time to create a DateTime variable
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

#Create a line plot of Sub_metering_1 
#add a line for Sub_metering_2 in red 
#add a line for Sub_metering_3 in blue
#added a legend, the extra space is at the end of each Sub_metering because it was
#being cutoff in the png file, so by adding the space the full name was shown
plot(data$DateTime,data$Sub_metering_1, type='l', ylab='Energy sub metering',xlab='')
lines(data$DateTime,data$Sub_metering_2, type='l', col='red')
lines(data$DateTime,data$Sub_metering_3, type='l', col='blue')
legend("topright", pch='-', col=c('black','red','blue'),
       legend=c("Sub_metering_1          ",
                "Sub_metering_2          ",
                "Sub_metering_3          "))

#Copying the plot to a file plot3.png with 480 by 480 size
dev.copy(png,file="./plot3.png", width=480, height=480)
dev.off()
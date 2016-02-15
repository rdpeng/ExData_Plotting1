data<- read.table("household_power_consumption.txt", sep=";", header=T, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?")

# Subsetting the full data to obtain the data related to two days: 
data<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 
# change the date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data$DateTime <- as.POSIXct(paste(data$Date, data$Time))



# creating Plot2
png("plot2.png", width=480, height= 480)

plot(data$DateTime, data$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="")

dev.off()
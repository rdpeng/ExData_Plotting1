
#Load & Subset Data

powpath<- "E:/1Rdata/household_power_consumption.txt"
powdat<- read.table(powpath,header=T,sep = ";",na.strings = "?",stringsAsFactors=FALSE)
chartdata <- subset(powdat,powdat$Date == "1/2/2007" | powdat$Date == "2/2/2007" )


# convert and create data series

datetime <- strptime(paste(chartdata$Date, chartdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(chartdata$Global_active_power)


# Create Plot and Genrate png file

png("plot2.png", width=480, height=480)

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()




# Load & Subset Data

powpath<- "E:/1Rdata/household_power_consumption.txt"
powdat<- read.table(powpath,header=T,sep = ";",na.strings = "?",stringsAsFactors=FALSE)
chartdata <- subset(powdat,powdat$Date == "1/2/2007" | powdat$Date == "2/2/2007" )

# convert and create data series

globalActivePower <- as.numeric(chartdata$Global_active_power)


# Create Plot and Genrate png file

png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()



unzip(zipfile="./exdata_data_household_power_consumption.zip")

##read txt as table
powerconsumption<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric","numeric","numeric","numeric","numeric","numeric"))

##Format as date
powerconsumption$Date<-as.Date(powerconsumption$Date, "%d/%m/%Y")

##Subsetting data: 1 feb 2007 to 2 feb 2007
powerconsumption<-subset(powerconsumption,Date>=as.Date("2007-2-1")& Date<=as.Date("2007-2-2"))

##Delete incomplete cases
powerconsumption<-powerconsumption[complete.cases(powerconsumption),]

##Combine Date-Time
dateTime<-paste(powerconsumption$Date, powerconsumption$Time)
dateTime<-setNames(dateTime, "DateTime")
powerconsumption<-cbind(dateTime, powerconsumption)

##Format dateTime column
powerconsumption$dateTime<-as.POSIXct(dateTime)

##Plot1
hist(powerconsumption$Global_active_power, main = "Global Active Power", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", col = "red")

##Save plot
dev.copy(device = png, width = 480, height = 480, file = "Plot1.png")
dev.off()


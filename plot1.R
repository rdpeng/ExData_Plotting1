#Read the file
data<-read.table("household_power_consumption.txt",header = TRUE,sep = ";")

#Format the Date
data$Date <- as.Date(data$Date,"%d/%m/%Y")

#Subset the data with Date of "2007-02-01" & "2007-02-02"
newdata<-data[which(data$Date=="2007-02-01" | data$Date=="2007-02-02"),]

#Create Plot1 and output
newdata$Global_active_power<-as.numeric(as.character(newdata$Global_active_power))
Global_active_power<-newdata$Global_active_power
png("plot1.png",480,480)
hist(Global_active_power,main="Global Active Power", col="red", xlab="Global Active Power(kilowatts)")
dev.off()

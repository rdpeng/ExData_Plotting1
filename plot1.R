mydata <- read.csv("~/R/DataVizCourse/exdata_data_household_power_consumption/filtered_data.csv",header=TRUE)
names(mydata)[names(mydata)=="ï..Date"] <- "Date"
mydata$DateTime <- strptime(paste(mydata$Date,mydata$Time),format="%d/%m/%Y %H:%M:%S")
rm(mydata)

#Plot1 in R
hist(mydata$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")

#Plot1 to PNG
png(file="plot1.png",width=480,height=480,units="px")
hist(mydata$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")
dev.off()
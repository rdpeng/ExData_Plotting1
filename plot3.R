mydata <- read.csv("~/R/DataVizCourse/exdata_data_household_power_consumption/filtered_data.csv",header=TRUE)
names(mydata)[names(mydata)=="ï..Date"] <- "Date"
mydata$DateTime <- strptime(paste(mydata$Date,mydata$Time),format="%d/%m/%Y %H:%M:%S")
rm(mydata)

#Plot3 in R
with(mydata, {
  plot(DateTime,Sub_metering_1,type="l",xlab="", ylab="Energy sub metering")
  lines(DateTime,Sub_metering_2,type="l",col="red")
  lines(DateTime,Sub_metering_3,type="l",col="blue")
  legend("topright",lwd=1,col=(c("black","red","blue")),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})

#Plot3 in PNG
png(file="plot3.png",width=480,height=480,units="px")
with(mydata, {
  plot(DateTime,Sub_metering_1,type="l",xlab="", ylab="Energy sub metering")
  lines(DateTime,Sub_metering_2,type="l",col="red")
  lines(DateTime,Sub_metering_3,type="l",col="blue")
  legend("topright",lwd=1,col=(c("black","red","blue")),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})
dev.off()
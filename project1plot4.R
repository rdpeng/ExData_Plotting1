#getwd()
#setwd("/Users/hui/Documents/datasciencecoursera/exploratory data analysis")
#getwd()

#read data
data <- read.table(file="household_power_consumption.txt", header=TRUE,sep=";",na.strings="?",fill=TRUE,stringsAsFactors=FALSE)
#check if data is right
head(data)

#choose data from 1/2/2007 to 2/2/2007
partData <- subset(data,Date=="1/2/2007"|Date=="2/2/2007")

#check data
nrow(partData)
completeData <- partData[complete.cases(partData),]

#plot in a png file
png(file="plot4.png")
#getfull time from Date and Time,notice the format
comTime <- with(completeData,strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"))

#decide multiple graphs position
par(mfrow=c(2,2))

#legendStr=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
with(completeData,{
  #plot first graph
  plot(comTime,Global_active_power,col="black",type="l",xlab="",ylab="Global Active Power")
  
  #plot second graph
  plot(comTime,Voltage,col="black",type="l",xlab="datetime",ylab="Voltage")
  xlab="datetime"
  
  #plot third graph
  plot(comTime,Sub_metering_1,col="black",type="l",xlab="",ylab="Energy sub metering")
  lines(comTime,Sub_metering_2,col="red",type="l")
  lines(comTime,Sub_metering_3,col="blue",type="l")
  legend("topright",lty=1,lwd=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))
  
  #plot fourth graph
  plot(comTime,Global_reactive_power,col="black",type="l",xlab="datatime",ylab="Global_reactive_power")
  xlab="datetime"
  })
dev.off()


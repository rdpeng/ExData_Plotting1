## Read data from household_power_consumption.txt which is placed in the working directory
data <-read.table("household_power_consumption.txt",sep =";",colClasses="character",header = TRUE)

## Create a new column called DateTime which joins the Date column and time column
data$DateTime <- paste(data$Date,data$Time,sep=" ")

## Convert the Date column to Date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Convert the DateTime column to POSIXlt format
data$DateTime <- strptime(data$DateTime, format="%d/%m/%Y %H:%M:%S")

## Select the rows of data from the dates 2007-02-01 to 2007-02-02 and pass them to sdata
sdata<- data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]

## Convert the Sub_metering_1, Sub_metering_2 and Sub_metering_3 to numric format
sdata[,c(7,8,9)]<-lapply(sdata[,c(7,8,9)],as.numeric)

## Create a PNG file called plot3.png and set its size to 480px * 480px
png(filename="plot3.png",width = 480, height = 480,units = "px")

## Plot a line graph of Sub_metering_1 vs DateTime and add label of y-axis
plot(sdata$DateTime,sdata[,7],type="l",main=NULL,xlab="",ylab="Energy sub metering")

## Add a red line for Sub_metering_2
lines(sdata$DateTime, sdata[,8], col = "red")

## Add a blue line for Sub_metering_3
lines(sdata$DateTime, sdata[,9], col = "blue")

## Add a legend on the top right hand side with 3 line colours 
legend("topright", col = c("black","blue", "red"), lty=1, legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

## The plot has been copied to the PNG file
dev.off()
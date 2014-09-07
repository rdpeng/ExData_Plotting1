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

## Convert the Global_active_power column to numric format
sdata$Global_active_power<-as.numeric(sdata$Global_active_power)

## Convert the Voltage column to numeric
sdata$Voltage <- as.numeric(sdata$Voltage)

## Convert the Global_reactive_power column to numeric
sdata$Global_reactive_power <- as.numeric(sdata$Global_reactive_power)

## Create a PNG file called plot4.png and set its size to 480px * 480px
png(filename="plot4.png",width = 480, height = 480,units = "px")

## Set the plot panel to consist of 2 rows and 2 columns
par(mfrow = c(2, 2))

## Plot the panel of 2 rows * 2 columns
with(sdata, {
  ## Plot a line graph of Global_active_power vs DateTime
  plot(DateTime, Global_active_power, main = NULL,xlab="",ylab="Global Active Power",type="l")
  
  ## Plot a line graph of Voltage vs DateTime
  plot(DateTime, Voltage, main = NULL,xlab="datetime",ylab="Voltage",type="l" )
  
  ## Plot a line graph of Sub_metering_1 vs DateTime and add label of y-axis
  plot(DateTime,Sub_metering_1,type="l",main=NULL,xlab="",ylab="Energy sub metering")
  
  ## Add a red line for Sub_metering_2
  lines(DateTime, Sub_metering_2, col = "red")
  
  ## Add a blue line for Sub_metering_3
  lines(DateTime, Sub_metering_3, col = "blue")
  
  ## Add a legend on the top right hand side with 3 line colours and set the box to be the type without border
  legend("topright", col = c("black","blue", "red"), bty="n",lty=1, legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  
  ## Plot a line graph of Global_reactive_power vs DateTime
  plot(DateTime, Global_reactive_power, main=NULL, xlab="datetime",ylab="Global_reactive_power",type="l")
})

## The plot has been copied to the PNG file
dev.off()
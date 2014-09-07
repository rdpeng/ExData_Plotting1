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

## Convert the Global_active_power column to numric format
sdata$Global_active_power<-as.numeric(sdata$Global_active_power)

## Create a PNG file called plot1.png and set its size to 480px * 480px
png(filename="plot1.png",width = 480, height = 480,units = "px")

## Plot a histogram of Global_active_power and add title, labels of x-axis and y-axis and color
hist(sdata$Global_active_power,main = "Global Active Power",xlab = "Global Active Power (kilowatts)",ylab = "Frequency", col = "red",breaks = 12)

## The histogram has been copied to the PNG file
dev.off()
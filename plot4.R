## Exploratory data analysis
## Project 1
## Plot 4
Sys.setlocale("LC_ALL","C")
unzip("exdata_data_household_power_consumption.zip")
a <- read.csv("household_power_consumption.txt",header=TRUE , sep=";")
head(a,n=10)
a$Date <- as.Date(a$Date, format="%d/%m/%Y")
data <- subset(a , Date=='2007-02-01'|Date=='2007-02-02')

str(data)
head(data)
Date_Time <- paste(data$Date,data$Time)
Date_Time <- strptime(Date_Time, format="%Y-%m-%d %H:%M:%S")
str(Date_Time)
data <- cbind(Date_Time, data[,3:9])
head(data)

GAP<- as.numeric(levels(data[,2])[data[,2]])
GRP<- as.numeric(levels(data[,3])[data[,3]])
Voltage <- as.numeric(levels(data[,4])[data[,4]])
Sub_metering_1 <-as.numeric(levels(data[,6])[data[,6]])
Sub_metering_2 <-as.numeric(levels(data[,7])[data[,7]])
Sub_metering_3 <-data[,8]

par(mfrow=c(2,2))

plot(data[,1],GAP,type="l",ylab="Global Active Power (kilowatts)", xlab="")

plot(data[,1],Voltage,type="l",ylab="Voltage", xlab="datetime")

plot(c(data[,1],data[,1],data[,1]),c(Sub_metering_1,Sub_metering_2,Sub_metering_3),
     type="n",ylab="Energy sub metering",xlab="")
lines(data[,1],Sub_metering_1,col="black")
lines(data[,1],Sub_metering_2,col="red")
lines(data[,1],Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), pch="_",bty= "n", cex=0.5,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(data[,1],GRP,type="l", ylab="Global_reactive_power",xlab="datetime")

dev.copy(png, file="plot4")
dev.off()
list.files()

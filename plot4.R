#This code uses data from the “Individual household electric power consumption Data Set” from the UC Irvine Machine Learning Repository. To use this code, download and unzip the dataset and save to a folder called "Exploratory Data"

data<-read.table("./ExploratoryData/household_power_consumption.txt", sep=";", header=TRUE) #read in data

data$Date<-as.Date(data$Date, "%d/%m/%Y") #convert Date column to date

df<-data[(data$Date=="2007-02-01"|data$Date=="2007-02-02"),] #subset for desired days

df$Global_active_power<-as.numeric(levels(df$Global_active_power))[df$Global_active_power] 
df$Sub_metering_1<-as.numeric(levels(df$Sub_metering_1))[df$Sub_metering_1]
df$Sub_metering_2<-as.numeric(levels(df$Sub_metering_2))[df$Sub_metering_2]
df$Voltage<-as.numeric(levels(df$Voltage))[df$Voltage]
df$Global_reactive_power<-as.numeric(levels(df$Global_reactive_power))[df$Global_reactive_power]
#convert relevant columns from factors to numeric

df$dt<-paste(df$Date, df$Time) #create new variable with date and time
df$dt<-strptime(df$dt, format="%Y-%m-%d %H:%M:%S") #convert from character to POSIXlt

par(mfrow=c(2,2),mar=c(4,4,2,2)) #set 2 rows and 2 columns, adjust margins
plot(df$dt, df$Global_active_power, type="l", xlab="", ylab="Global Active Power") #plot 1
plot(df$dt, df$Voltage, type="l", xlab="datetime", ylab="Voltage") #plot 2
plot(df$dt, df$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering") #
    lines(df$dt, df$Sub_metering_1, col="black")
    lines(df$dt, df$Sub_metering_2, col="red")
    lines(df$dt, df$Sub_metering_3, col="blue")
    legend("topright", lwd=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", cex=0.7, x.intersp=0, y.intersp=.5) #plot 3
plot(df$dt, df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power") #plot 4

dev.copy(png, file="plot4.png",width = 480, height = 480, units = "px") #copy to png
dev.off() #close device

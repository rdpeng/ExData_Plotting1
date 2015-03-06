#This code uses data from the “Individual household electric power consumption Data Set” from the UC Irvine Machine Learning Repository. To use this code, download and unzip the dataset and save to a folder called "Exploratory Data"

data<-read.table("./ExploratoryData/household_power_consumption.txt", sep=";", header=TRUE) #read in data

data$Date<-as.Date(data$Date, "%d/%m/%Y") #convert Date column to date

df<-data[(data$Date=="2007-02-01"|data$Date=="2007-02-02"),] #subset for desired days

df$Global_active_power<-as.numeric(levels(df$Global_active_power))[df$Global_active_power] 
df$Sub_metering_1<-as.numeric(levels(df$Sub_metering_1))[df$Sub_metering_1]
df$Sub_metering_2<-as.numeric(levels(df$Sub_metering_2))[df$Sub_metering_2]
#convert from factors to numeric

df$dt<-paste(df$Date, df$Time) #create new variable with date and time
df$dt<-strptime(df$dt, format="%Y-%m-%d %H:%M:%S") #convert from character to POSIXlt

plot(df$dt, df$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering") #create empty plot and annotate
lines(df$dt, df$Sub_metering_1, col="black")
lines(df$dt, df$Sub_metering_2, col="red")
lines(df$dt, df$Sub_metering_3, col="blue")
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png",width = 480, height = 480, units = "px") #copy to png
dev.off() #close device
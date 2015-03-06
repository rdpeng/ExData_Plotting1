#This code uses data from the “Individual household electric power consumption Data Set” from the UC Irvine Machine Learning Repository. To use this code, download and unzip the dataset and save to a folder called "Exploratory Data"

data<-read.table("./ExploratoryData/household_power_consumption.txt", sep=";", header=TRUE) #read in data

data$Date<-as.Date(data$Date, "%d/%m/%Y") #convert Date column to date

df<-data[(data$Date=="2007-02-01"|data$Date=="2007-02-02"),] #subset for desired days

df$Global_active_power<-as.numeric(levels(df$Global_active_power))[df$Global_active_power] #convert from factors to numeric

df$dt<-paste(df$Date, df$Time) #create new variable with date and time
df$dt<-strptime(df$dt, format="%Y-%m-%d %H:%M:%S") #convert from character to POSIXlt

plot(df$dt, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)") #create plot

dev.copy(png, file="plot2.png",width = 480, height = 480, units = "px") #copy to png
dev.off() #close device
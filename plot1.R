#This code uses data from the “Individual household electric power consumption Data Set” from the UC Irvine Machine Learning Repository. To use this code, download and unzip the dataset and save to a folder called "Exploratory Data"

data<-read.table("./ExploratoryData/household_power_consumption.txt", sep=";", header=TRUE) #read in data

data$Date<-as.Date(data$Date, "%d/%m/%Y") #convert Date column to date

df<-data[(data$Date=="2007-02-01"|data$Date=="2007-02-02"),] #subset for desired days

df$Global_active_power<-as.numeric(levels(df$Global_active_power))[df$Global_active_power] #convert from factors to numeric

hist(df$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab= "Frequency") #create histogram

dev.copy(png, file="plot1.png",width = 480, height = 480, units = "px") #copy to png
dev.off() #close device
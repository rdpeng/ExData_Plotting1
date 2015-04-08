## Exploratory data analysis
## Project 1
## Plot 2
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
plot(data[,1],GAP,type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2")
dev.off()
list.files()

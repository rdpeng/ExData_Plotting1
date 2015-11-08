#reading the data
power.data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec=".",na.strings="?")
#exploring the data that has been read to determine how to proceed with plots
str(power.data)
#transforming Date and Time fields to select the records necessary for the plots #saving the original records before making changes
power.data$Date<-as.Date(power.data$Date,"%d/%m/%Y")
#checking structure of the data uploaded
str(power.data) 
#transforming the DATE field
power.data$DateTime<-paste(power.data$Date, power.data$Time)
power.data$DateTime<-strptime(power.data$DateTime, "%Y-%m-%d %H:%M:%S")
#checking the transformed data is correct
str(power.data)
#selection of subset for plots creating new object power.data.ss
date1<-strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S")
date2<-strptime("2007-02-02 23:59:59", "%Y-%m-%d %H:%M:%S")
myperiod<-function(x,y){power.data[power.data$DateTime >= x & power.data$DateTime <= y,]}
power.data.ss<-myperiod(date1,date2)
#checking the resulting subset makes sense in terms of format and number of records selected
str(power.data.ss)
#contents of power.data.ss 3120 observations including 9 variables each - OK
#PLOT 2: plot showing the changes to the Global Active Power variable throughout the period of interest
plot(power.data.ss$DateTime,power.data.ss$Global_active_power,type = "l",col = "black", lwd = 2, ylab = "Global Active Power (kilowatts)",xlab=" ")
dev.print(png, file = "plot2.png", width = 480, height = 480)

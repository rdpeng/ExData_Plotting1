# read the raw data
power_data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

# subset the data
power_data2<-subset(power_data,Date=="1/2/2007"|Date=="2/2/2007")

# convert the data into numeric 
power_data2$Global_active_power<-as.numeric(as.character(power_data2$Global_active_power))

# I want to use datetime format...
times<-as.character(power_data2$Time)
dates<-as.character(power_data2$Date)
x <- paste(dates, times)

# Let's create a new column in power_data2 with datetime info
power_data2$Date_time<-strptime(x, "%d/%m/%Y %H:%M:%S")

# Open the graphic device
png("plot2.png")
with(power_data2, plot(Date_time,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))

# Close the graphic device
dev.off()
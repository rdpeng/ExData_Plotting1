# read the raw data
power_data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
names(power_data)

# subset the data to include only 2 days
power_data2<-subset(power_data,Date=="1/2/2007"|Date=="2/2/2007")

# open the graphic device
png("plot1.png")

# the data was read in as a factor ---> I have to convert it to numeric
power_data2$Global_active_power<-as.numeric(as.character(power_data2$Global_active_power))

#make the histogram
with(power_data2,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()


## an script for loading and creating .phg figure for figure 1

# loading the data
data_<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# subsetting the data
data_sel<-data_[data_$Date == "1/2/2007" | data_$Date ==  "2/2/2007",]

# making the plots
png(filename="./plot1.png",width=480,height=480,units="px")
hist(data_sel$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
dev.off()








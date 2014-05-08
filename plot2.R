

## an script for loading and creating .png figure for figure 2

# loading the data
data_<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# subsetting the data
data_sel<-data_[data_$Date == "1/2/2007" | data_$Date ==  "2/2/2007",]
dandt_<-paste(data_sel$Date,data_sel$Time)
dandt_<-strptime(dandt_,"%d/%m/%Y %T")

# making the plots
png(filename="./plot2.png",width=480,height=480,units="px")
plot(dandt_,data_sel$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="n")
lines(dandt_,data_sel$Global_active_power)
dev.off()






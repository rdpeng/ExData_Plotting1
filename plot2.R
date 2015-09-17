data<-read.table("household_power_consumption.txt" ,sep=";",header = T,colClasses = "character")
data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Date<-as.Date(data$Date,"%d/%m/%Y")
#注意此处应为Y，应为y是对应17的，所以此处四位2017会取前两位变成2020年。
"%Y-%m-%d %H:%M:%S"
#format(as.Date(data$T), "%A")
data$T<-paste(data$Date,data$Time)
plot(data$Global_active_power,main="",type = "l"
     ,ylab = "Global Active Power (kilowatts)"
     ,xlab=NULL)
dev.copy(png,file="plot2.png")
dev.off()

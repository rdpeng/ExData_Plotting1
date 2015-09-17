data<-read.table("household_power_consumption.txt" ,sep=";",header = T,colClasses = "character")
data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
x<-as.numeric(data$Global_active_power)
hist(x,col="red",main = c("Global Active Power")
     ,xlab=c("Global Active Power (kilowatts)"))
dev.copy(png,file="plot1.png")
dev.off()
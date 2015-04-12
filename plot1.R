newdataset<-read.table("household_power_consumption.txt", 
                       header=TRUE,sep=";",
                       colClasses=c("character","character",rep("numeric",7)),
                       na="?")

dataset1<-subset(newdataset,Date=="1/2/2007")
dataset2<-subset(newdataset,Date=="2/2/2007")

hist(dataset1$Global_active_power, col="red", main="Global Active Power" ,xlab="Global_active_power(kilowatts)")
png(filename = "plot1.png", width = 480, height = 480)

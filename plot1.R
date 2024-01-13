png("plot1.png",width = 480,height=480)

#Loading the data , as you can see, I didnt  need the strptime 
#or the as.Date function(for now!)
data<- read.delim("household_power_consumption.txt",sep = ";")
library(data.table)
data<-data.table(data)
data1 <- data[Date%in%c("1/2/2007","2/2/2007"),]

View(data1)
data1$Global_active_power<-as.numeric(data1$Global_active_power)
hist(data1$Global_active_power,col = "red", xlab = "Global active power (kilowatts)",main = "Global active power")
dev.off()

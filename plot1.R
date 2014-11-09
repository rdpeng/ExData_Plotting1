#set working directory
setwd("C:/Users/Administrator/Desktop/R/data cleaning")
#read data from txt file, set";"as a indicator, "?"means missing variable
power<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
#change the class of "Date" into Date
power$Date<-as.Date(power$Date, "%d/%m/%Y") 
#Change it from factor into numeric
power$Global_active_power<-as.numeric(as.character(power$Global_active_power))
#subset 2007-2-1 & 2007-2-2 data
power2<-subset(power,Date=="2007-2-1" | Date=="2007-2-2")
#Generate a new variable to include the Date and Time
newdate<-strptime(paste(power2$Date,power2$Time),"%Y-%m-%d %H:%M:%OS")
#####################
#build plot 1 and save as png file
png(file="plot1.png",width=480,height=480)
hist(power2$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power(kilowatts)")
axis(side=1,at=c(200,400,600,800,1000,1200),labels=c(200,400,600,800,1000,1200))
dev.off()

a<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
a$Date<-as.Date(a$Date,format="%d/%m/%Y")
b1<-subset(a,Date=="2007-02-01")
b2<-subset(a,Date=="2007-02-02")
b<-rbind(b1,b2)
b$Global_active_power<-as.numeric(as.character(b$Global_active_power))
par(mar=c(4,4,2,1))
hist(b$Global_active_power,col="red",xlab="Global_Active_Power (kilowatts)",main="Global Active Power")


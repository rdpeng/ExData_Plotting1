#plot 2
#code assumes that the file is downloaded and unzipped in the working folder
install.packages("sqldf")
library(sqldf)
x<-read.csv.sql("household_power_consumption.txt",sql= "select * from file where Date in ('1/2/2007','2/2/2007')", sep=";",header=T,stringsAsFactors=F)
closeAllConnections()
x$Date<-as.Date(x$Date,"%d/%m/%Y")
x$date_time<-as.POSIXlt(paste(x$Date,x$Time),format="%Y-%m-%d %H:%M:%S")
png("plot2.png")
plot(x$date_time,x$Global_active_power,type="l",ylab="Global Active Power (in kilowatts)",xlab="",cex.lab=0.75)
dev.off()
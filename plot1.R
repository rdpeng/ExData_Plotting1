#plot 1
#code assumes that the file is downloaded and unzipped in the working folder
install.packages("sqldf")
library(sqldf)
x<-read.csv.sql("household_power_consumption.txt",sql= "select * from file where Date in ('1/2/2007','2/2/2007')", sep=";",header=T,stringsAsFactors=F)
closeAllConnections()
x$Date<-as.Date(x$Date,"%d/%m/%Y")
x$date_time<-as.POSIXlt(paste(x$Date,x$Time),format="%Y-%m-%d %H:%M:%S")
png("plot1.png")
hist(x$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (in kilowatts)")
dev.off()
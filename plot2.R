rm(list=ls())
setwd("Z:/MyDoc/gauravR/ExpDataAnalysis/CP1")

data=read.table("household_power_consumption.txt",header=T,stringsAsFactors=F,sep=";")
data$Date= as.Date(data$Date,"%d/%m/%Y")
data=data[data$Date %in% as.Date(c("2007-02-01","2007-02-02")),]

#####plot2
data=read.table("household_power_consumption.txt",header=T,stringsAsFactors=F,sep=";")
data$Date= as.Date(data$Date,"%d/%m/%Y")
data=data[data$Date %in% as.Date(c("2007-02-01","2007-02-02")),]
data=within(data,{timestamp=format(as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S") })
png(filename = "plot2.png",width = 480, height = 480)
x= strptime(data$timestamp,"%d/%m/%Y %H:%M:%S")
y=as.numeric(data$Global_active_power)
plot(x,y,type="l",xlab="",ylab="Global Active Power (killowatts)")
dev.off()


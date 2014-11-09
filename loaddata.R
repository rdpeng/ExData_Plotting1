x<-read.table('household_power_consumption.txt',header=TRUE,sep=';',colClasses = c("character", "character", rep("numeric",7)),na = "?")
data<-x[x$Date=='1/2/2007' | x$Date=='2/2/2007',]
data$DateTime<-as.POSIXct(paste(as.Date(data$Date,"%d/%m/%Y"),data$Time))

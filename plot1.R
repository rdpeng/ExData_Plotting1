rm(list=ls())
setwd("Z:/MyDoc/gauravR/ExpDataAnalysis/CP1")
data=read.table("household_power_consumption.txt",header=T,stringsAsFactors=F,sep=";")
data$Date= as.Date(data$Date,"%d/%m/%Y")
data=data[data$Date %in% as.Date(c("2007-02-01","2007-02-02")),]

data$Global_active_power= as.numeric(data$Global_active_power)

png(filename = "plot1.png",width = 480, height = 480)
hist(data$Global_active_power,col="red",
xlab= "Global Active Power (killowatts)",main="Frequency")
dev.off()

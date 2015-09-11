setwd("C:/Users/monahaghighi/Desktop")
datanew<-read.table(file.choose(),header=TRUE,sep=';')
datanew<-as.data.frame(datanew)
select <-datanew[(as.character(datanew[,1])=="1/2/2007" | as.character(datanew[,1])=="2/2/2007" ),]
with(select,hist(as.numeric(Global_active_power),breaks=13,col="red",xlab='Global Active Power (kilowatts)',main='Global Active Power'))
dev.copy(png,file='plot1.png')
dev.off()

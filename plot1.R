plot1<-function (){
  data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
  Feb1<-data[data$Date=="1/2/2007",]
  Feb2<-data[data$Date=="2/2/2007",]
  Feb<-rbind(Feb1,Feb2)
  Feb[,1]<-as.Date(Feb[,1],format='%d/%m/%Y')
  png(file = "plot1.png",width = 480, height = 480, units = "px")
  with(faithful, hist(as.numeric(as.character(Feb[,3])),xlab="Global Active Power(kilowatts)",main="Global Active Power",col="red"))
  dev.off()
  
}

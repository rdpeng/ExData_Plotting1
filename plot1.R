x<-read.table("household_power_consumption.txt",header = TRUE,sep = ";")
a<-x[x[,1]=="2/2/2007"]
b<-x[x[,1]=="1/2/2007",]
c<-rbind(b,a)
c[,3]<-as.numeric(as.character(c[,3]))
hist(c[,3],15,col = "red",main = "Global Active Power",xlab = "Global Active Power(kilowatts)")
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()
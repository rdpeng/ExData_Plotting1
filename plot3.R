library(dplyr)
###reading in of data for plotting(Only relevant data has been read in)
energycol=read.csv("household_power_consumption.txt",sep=";",nrow=1)
energy=read.csv("household_power_consumption.txt",sep=";",skip=64800, nrow=5000)
colnames(energy)<-colnames(energycol)
### Removing the Date and time Component for intermediate processing

energint<-select(energy,-(Date:Time))
energytime<-paste(energy[,1],energy[,2])
energytime<-strptime(energytime,"%d/%m/%Y %H:%M:%S")
#### finalplot for plot
eneplot<-cbind(energytime,energint)


###Final data ready for plot
ene_plo<-filter(eneplot,energytime >= "2007-02-01" & energytime <="2007-02-03")
 png(filename= "plot3.png",  width = 480, height = 480, units = "px")
   plot(ene_plo$energytime,ene_plo$Sub_metering_1,type="n",xlab=" ", ylab="Energy sub metering")
lines(ene_plo$energytime,ene_plo$Sub_metering_1,col="black")
lines(ene_plo$energytime,ene_plo$Sub_metering_2,col="red")
lines(ene_plo$energytime,ene_plo$Sub_metering_3,col="blue")
legend("topright",legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.off()
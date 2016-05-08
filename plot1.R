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
 png(filename= "plot1.png",  width = 480, height = 480, units = "px")
hist(ene_plo$Global_active_power, col="red",xlab="Global Active Power (Kilowatts)",main= ("Global Active Power") )
dev.off()

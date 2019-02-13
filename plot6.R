NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
SCCsub<-filter(SCC,SCC.Level.Two == "Highway Vehicles - Diesel"  |SCC.Level.Two == "Highway Vehicles - Gasoline")
ye=1999

for (i in 1:9){
        ye=c(ye,ye[i]+1)
} 
sumem<-NULL
for (i in 1:length(ye)){
        a<-filter(NEI,year==ye[i],SCC%in%SCCsub$SCC,fips=="24510")
        sumem<-c(sumem,sum(a$Emissions))
}


sumem2<-NULL
for (i in 1:length(ye)){
        a<-filter(NEI,year==ye[i],SCC%in%SCCsub$SCC,fips=="06037")
        sumem2<-c(sumem2,sum(a$Emissions))
}

png("plot6.png")
plot(ye,sumem2,type ="n",xlab="year",ylab= "PM25",main = "Comparison for PM2.5")
points(ye,sumem,pch=19)
points(ye,sumem2,pch=2,cex=1.5)
legend("center",pch=c(19,2), legend = c("Baltimore City","Los Angeles County"))
dev.off()

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





png(filename = "plot5.png")
plot(ye,sumem,pch=19,xlab="Year", ylab = "Total PM25 Emissions (tons)", main = "PM25 for Baltimore City from motor vehicles")
dev.off()


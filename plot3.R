NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
ye=1999

for (i in 1:9){
        ye=c(ye,ye[i]+1)
} 
ty <- c("POINT", "NONPOINT", "ON-ROAD","NON-ROAD")


df<-data.frame(NULL)
for (j in 1:length(ty)){
        sumem<-NULL
for (i in 1:length(ye)){
        a<-filter(NEI,year==ye[i],fips=="24510",type == ty[j] )
        sumem<-c(sumem,sum(a$Emissions))
}
        tempdf<-data.frame(year=ye,type=rep(ty[j],10),pm25=sumem)
        df<-rbind(tempdf,df)
}
        
        
png(filename = "plot3.png")
t<-ggplot(df,aes(year,pm25))+geom_point()+facet_grid(.~type)+ylab("PM2.5 Emissions (tons)")
print(t)
dev.off()
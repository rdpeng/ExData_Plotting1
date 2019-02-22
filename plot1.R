library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
ye<-c(1999,2002,2005,2008)
sumem<-NULL
for (i in 1:length(ye)){
        a<-filter(NEI,year==ye[i])
        sumem<-c(sumem,sum(a$Emissions))
}
png(filename = "plot1.png")
plot(ye,sumem,pch=19,xlab="Year", ylab = "Total PM25 Emissions (tons)")
dev.off()
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEISCC <- merge(NEI, SCC, by="SCC")
library(dplyr)
NEISCCdp <- tbl_df(NEISCC)

NEISCCdp <- mutate(NEISCCdp, coal = grepl("coal", NEISCCdp$Short.Name, ignore.case=TRUE)) 
EmissionsCoalYear <- summarize(group_by(filter(NEISCCdp, coal==TRUE),year),sum(Emissions))
colnames(EmissionsCoalYear) <- c("Year", "Emissions") 

EmissionsCoalYear$Year <- as.character(EmissionsCoalYear$Year)
EmissionsCoalYear$EmissionsInTousands = EmissionsCoalYear$Emissions/1000

library(ggplot2)
png('plot4.png')
g <- ggplot(EmissionsCoalYear, aes(Year, EmissionsInTousands))
g+geom_bar(stat='identity')+labs(title="Emissions from coal combustion-related sources", x="Years",y="Emissions (PM 2.5) in thousands")
dev.off()

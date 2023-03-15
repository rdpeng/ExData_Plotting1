#Course Project 2 (plot3)
#loading packages
library("ggplot2")
library("dplyr")

#read the file and take the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#calculate emissions of Baltimore
emission_Balt <- summarise(group_by(subset(NEI, fips = "24510"), type, year), 
                           Emissions = sum(Emissions))

#using ggplot2 to plot
ggplot(emission_Balt, aes(x = factor(year), y = Emissions, fill = type, 
                       label = round(Emissions))) + geom_bar(stat = "identity") + 
        facet_grid(. ~ type) + 
        ggtitle("Total PM2.5 Emissions in Baltimore City") + 
        xlab("Year")+ ylab("PM2.5 Emissions (Tons)") + 
        theme(plot.title = element_text(hjust = 0.7))

#copy the graphic to the file
dev.copy(png, file = "plot3.png")
dev.off()
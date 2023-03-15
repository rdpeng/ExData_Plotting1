#Course Project 2 (plot4)
#loading packages
library("ggplot2")
library("dplyr")

#read the file and take the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC_data <- readRDS("Source_Classification_Code.rds")

#calculate emissions from coal
coal_data <- grepl("Comb.*Coal", SCC_data$EI.Sector)
combustion_coal <- SCC_data[coal_data, ]
emissions_combustion <- NEI[(NEI$SCC %in% combustion_coal$SCC), ]
emissions_coal <- summarise(group_by(emissions_combustion, year), 
                            Emissions=sum(Emissions))

#using ggplot2 to plot
ggplot(emissions_coal, aes(x=factor(year), y=Emissions/1000,fill=year, 
                           label = round(Emissions/1000,2))) + 
        geom_bar(stat="identity") +
        xlab("year") +
        ylab(expression("total PM2.5 emissions (kilotons)")) +
        ggtitle("Emissions from coal combustion-related sources (kilotons)")+
        geom_label(aes(fill = year),colour = "red")

#copy the graphic to the file
dev.copy(png, file = "plot4.png")
dev.off()
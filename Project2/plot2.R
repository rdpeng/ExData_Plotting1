#Course Project 2 (plot2)
#loading packages
library("ggplot2")
library("dplyr")

#read the file and take the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#calculate emissions of Baltimore
emission_Balt <- summarise(group_by(subset(NEI, fips = "24510"), year), 
                            Emissions = sum(Emissions))

#using base plotting system show PM2.5 emission of Baltimore
plot_bar2 <- barplot(emission_Balt$Emissions/1000, 
                     main = "Total PM2.5 Emissions in Baltimore City", 
                     xlab = "Year", ylab = "PM2.5 Emissions (Tons)", 
                     names.arg = emission_Balt$year, col = "darkred", 
                     ylim = c(0, 8000))
text(plot_bar2, round(emission_Balt$Emissions/1000), 
     label = round(emission_Balt$Emissions/1000), pos = 3, 
     cex = 1.2)

#copy the graphic to the file
dev.copy(png, file = "plot2.png")
dev.off()
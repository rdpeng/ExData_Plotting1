#Course Project 2 (plot1)
#loading packages
library("ggplot2")
library("dplyr")

#read the file and take the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#calculate the total emissions
emission_year <- summarise(group_by(NEI, year), Emissions=sum(Emissions))

#using base plotting system show PM2.5 emission
plot_bar1 <- barplot(emission_year$Emissions/1000, main = "Total PM2.5 Emissions", 
                    xlab = "Year", ylab = "PM2.5 Emissions in Kilotons", 
                    names.arg = emission_year$year, col = "red", 
                    ylim = c(0,8000))
text(plot_bar1, round(emission_year$Emissions/1000), 
                     label = round(emission_year$Emissions/1000), pos = 3, 
                     cex = 1.2)

#copy the graphic to the file
dev.copy(png, file = "plot1.png")
dev.off()

#Course Project 2 (plot6)
#loading packages
library("ggplot2")
library("dplyr")

#read the file and take the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC_data <- readRDS("Source_Classification_Code.rds")
data_motor <- SCC_data[grepl("Vehicle", SCC_data$SCC.Level.Two), ]
ssc_motor <- unique(data_motor$SCC)
emission_motor <- NEI[(NEI$SCC %in% ssc_motor), ]

#compare emmisions from motor
compare_year <- emission_motor %>% filter(fips == "24510" | fips == "06037") %>% 
        group_by(fips, year) %>% summarise(Emissions = sum(Emissions))
compare_year <- mutate(compare_year, 
                       Unit = ifelse(fips == "24510", "Baltimore City", 
                                     ifelse(fips == "06037", "Los Angeles County")))

#using ggplot2 to plot
ggplot(compare_year, aes(factor(year), Emissions, 
                          fill = Unit, label = round(Emissions))) + 
        geom_bar(stat = "identity") + facet_grid(. ~ Unit) + 
        ggtitle("Total Motor Vehicle Emissions") +
        xlab("Year") + ylab("PM 2.5 Emissions in Tons") +
        theme(plot.title = element_text(hjust = 0.5)) + ylim(c(0, 8000)) +
        theme_classic() + geom_text(size = 4, vjust = -1)

#copy the graphic to the file
dev.copy(png, file = "plot6.png")
dev.off()
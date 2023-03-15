#Course Project 2 (plot5)
#loading packages
library("ggplot2")
library("dplyr")

#read the file and take the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC_data <- readRDS("Source_Classification_Code.rds")

#calculate emissions from motor
data_motor <- SCC_data[grepl("Vehicle", SCC_data$SCC.Level.Two), ]
ssc_motor <- unique(data_motor$SCC)
emission_motor <- NEI[(NEI$SCC %in% ssc_motor), ]
motor_y <- emission_motor %>% filter(fips == "24510") %>% group_by(year) %>% 
        summarise(Emissions = sum(Emissions))

#using ggplot2 to plot
ggplot(motor_y, aes(factor(year), Emissions, label = round(Emissions))) + 
        geom_bar(stat = "identity", fill = "red") + 
        ggtitle("Total Motor Emissions in Baltimore City") + 
        xlab("Year") + ylab("PM2.5 Emissions (Tones)") +
        ylim(c(0, 450)) + theme_classic()+ geom_text(size = 5, vjust = -1) + 
        theme(plot.title = element_text(hjust = 0.5))

#copy the graphic to the file
dev.copy(png, file = "plot5.png")
dev.off()
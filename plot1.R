


setwd("C:/Users/Jeffrey/Desktop/Coursera/Power Consumption")
unzip('exdata%2Fdata%2Fhousehold_power_consumption.zip')
StageIn   <- read.table('household_power_consumption.txt',header=TRUE,dec='.',sep=';',stringsAsFactors=FALSE)
Transform <- StageIn[StageIn$Date %in% c("1/2/2007","2/2/2007") ,]
df <- as.data.frame(Transform)	
df <- subset(df,Global_active_power != '?')               


png("plot1.png", width=480, height=480)
hist(as.numeric(df$Global_active_power),col='red',main = 'Global Active Power',xlab='Global Active Power (kilowatts)')
dev.off()











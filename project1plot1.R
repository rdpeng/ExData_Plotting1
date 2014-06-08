#getwd()
#setwd("/Users/hui/Documents/datasciencecoursera/exploratory data analysis")
#getwd()

#read data
data <- read.table(file="household_power_consumption.txt", header=TRUE,sep=";",na.strings="?",fill=TRUE)
#check if data is right
head(data)

#choose data from 1/2/2007 to 2/2/2007
partData <- subset(data,Date=="1/2/2007"|Date=="2/2/2007")

#check data
nrow(partData)

#plot in a png file
png(file="plot1.png")
hist(partData$Global_active_power,col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()

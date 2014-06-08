#getwd()
#setwd("/Users/hui/Documents/datasciencecoursera/exploratory data analysis")
#getwd()

#read data
data <- read.table(file="household_power_consumption.txt", header=TRUE,sep=";",na.strings="?",fill=TRUE,stringsAsFactors=FALSE)
#check if data is right
head(data)

#choose data from 1/2/2007 to 2/2/2007
partData <- subset(data,Date=="1/2/2007"|Date=="2/2/2007")

#check data
nrow(partData)
completeData <- partData[complete.cases(partData),]
completeData <- completeData[ ,c(1,2,3)]


#plot in a png file
png(file="plot2.png")
#getfull time from Date and Time,notice the format
comTime <- with(completeData,strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"))

#plot to png file
plot(comTime,completeData$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()


# Exploratory Data Analysis Course Project 1 Plot 3

#Read text file "household_power_consumption.txt" into data file "power".
power<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?",nrows=2075259)

#Select valid dates from the data file.
validdate<-power[,1]=="1/2/2007"|power[,1]=="2/2/2007"
validdata<-power[validdate,]

#Add a column "datetime" that combines the Date and Time columns into a single Posix column.
x<-paste(validdata[,1],validdata[,2])
DateTime <- strptime(x, format="%d/%m/%Y %H:%M:%S")
validdata<-cbind(validdata,DateTime)

#Create Variable "namesplot" to be used in the legend.
namesplot<-names(validdata[,7:9])

#Plot the columns Sub-metering_1 (validdata[,7]), Sub-metering_2 (validdata[,8]), and Sub-metering_3  (validdata[,9]), to a single plot with a legend in the upper right corner.  Then print to a plot3.png file at the default 480X480 pixels and 72 dpi resolution.
#Begin printing to file "plot3.png."
png("plot3.png")

#Plot first column of data, Sub-metering_1, and include label for y axis.
plot(validdata[,10],validdata[,7], ylim=range(c(validdata[,7],validdata[,8],validdata[,9])), type="l", xlab=NA,ylab="Energy sub metering",col="black")

#Plot second column of data, Sub-metering_2, on same palatte with no labels at all.
par(new = TRUE)
plot(validdata[,10],validdata[,8], ylim=range(c(validdata[,7],validdata[,8],validdata[,9])),type="l", xlab=NA, ylab=NA,col="red")

#Plot third column of data, Sub-metering_3, on above palatte again with no labels.
par(new = TRUE)
plot(validdata[,10],validdata[,9], ylim=range(c(validdata[,7],validdata[,8],validdata[,9])),type="l", xlab=NA,ylab=NA,col="blue")

#Add a boxed legend to the above plot in the upper right hand corner.
legend("topright", inset=0,c(namesplot), lty=c(1,1,1), col=c("black","red","blue"))

#Stop printing to the file.
dev.off()


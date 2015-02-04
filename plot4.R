# Exploratory Data Analysis Course Project 1 Plot 4

#Read text file "household_power_consumption.txt" into datafile "power".
power<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?",nrows=2075259)

#Select valid dates from the file.
validdate<-power[,1]=="1/2/2007"|power[,1]=="2/2/2007"
validdata<-power[validdate,]

#Add a column "datetime" that combines the Date and Time columns into a single Posix column.
x<-paste(validdata[,1],validdata[,2])
datetime <- strptime(x, format="%d/%m/%Y %H:%M:%S")
validdata<-cbind(validdata,datetime)

#Create Variable "namesplot" to be used in the legend of those plots requiring such.
namesplot<-names(validdata[,7:9])

#Plot the 6 columns Global_active_power, Sub_metering_1, Sub_metering_2, Sub_metering_3, Voltage and Global_reactive_power, respectively, to 4 plots formatted as a 2X2 column matrix.  Then print to a file entitled plot4.png at the default 480X480 pixels at 72 dpi resolution.

#Begin print to file "plot4.png."
png("plot4.png")

#Create 2X2 column matrix plot palette.
par(mfcol=c(2,2))

#First plot located in upper left hand position.
plot(validdata[,10],validdata[,3], type="l", xlab=NA,ylab="Global Active Power")

#Second plot is a combination of 3 columns located in the lower left hand position.
#Plot first column of data, Sub-metering_1, and include label for y axis.
plot(validdata[,10],validdata[,7], ylim=range(c(validdata[,7],validdata[,8],validdata[,9])), type="l", xlab=NA,ylab="Energy sub metering",col="black")

#Plot second column of data, Sub-metering_2, on same palatte with no labels at all.
par(new = TRUE)
plot(validdata[,10],validdata[,8], ylim=range(c(validdata[,7],validdata[,8],validdata[,9])),type="l", xlab=NA, ylab=NA,col="red")

#Plot third column of data, Sub-metering_3, on above palatte again with no labels.
par(new = TRUE)
plot(validdata[,10],validdata[,9], ylim=range(c(validdata[,7],validdata[,8],validdata[,9])),type="l", xlab=NA,ylab=NA,col="blue")

#Plot legend in upper right hand corner of second plot without with no box around the legend.
legend("topright", inset=0,c(namesplot), lty=c(1,1,1), col=c("black","red","blue"), bty="n")

#Third plot located in upper right hand position.
plot(validdata[,10],validdata[,5], type="l", xlab="datetime",ylab="Voltage",col="black")

#Fourth plot located in lower right hand position.
plot(validdata[,10],validdata[,4], type="l", xlab="datetime",ylab="Global_reactive_power",col="black")

#End printing of file "plot4.png."
dev.off()

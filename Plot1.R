power.data=read.table("household_power_consumption.txt",sep=";",header=TRUE)

#Transform Date variable to as.Date()
power.data$Date=as.Date(power.data$Date,format="%d/%m/%Y")

#Extract observations corresponding to Feb 1st and Feb 2nd 2007.
sub=subset(power.data, Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))

#Format Time variable to POSIXlt format
a=paste(as.character(sub$Date),as.character(sub$Time),sep=" ")
b=strptime(a,format="%Y-%m-%d %H:%M")
sub$Time=b

#Transform rest of variables from factor to numeric
 for (i in 3:9)
 {
  sub[,i]=as.numeric(as.character(sub[,i]))
 }


data=sub

#Plot 1: Stored in a png file
png("Plot1.png",bg="white")
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()

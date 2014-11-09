power <- read.csv("household_power_consumption.txt",header=T,sep=";",na.strings="?")
sub<-power[(power$Date=="1/2/2007"|power$Date=="2/2/2007"),]
concat = paste(sub$Date,sub$Time,sep=" ")
converttotime = strptime(concat, "%d/%m/%Y %H:%M:%S")
plot(converttotime,sub$Global_active_power,type="l",ylab="Global Active Power (kilowatts)", xlab="")
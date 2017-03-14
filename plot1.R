#I unzip the file in my working directory, so code begins from there, Same result if I use R functions for unzip

file="./household_power_consumption.txt"
powerc<-read.csv(file,sep=";",header=TRUE)
powcfeb2<-powerc[as.Date(powerc$Date,"%d/%m/%Y")==as.Date("02/02/2007","%d/%m/%Y"),]
powcfeb1<-powerc[as.Date(powerc$Date,"%d/%m/%Y")==as.Date("01/02/2007","%d/%m/%Y"),]
powcfeb<-rbind(powcfeb1,powcfeb2) 
#2880rows 9cols


powcfeb$Global_active_power<-as.character(p1$Global_active_power)
png(filename="plot1.png", width=480, height=480,units="px")

hist(as.double(powcfeb$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()

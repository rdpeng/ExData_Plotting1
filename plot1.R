# Reading data
fichier<-"household_power_consumption.txt"
d<-read.csv2(fichier, colClasses = "character", na.strings="?")

any(d=="?",na.rm=T)

d<-subset(d,subset=(d$Date %in% c("1/2/2007", "2/2/2007")))
#debut 66637 fin 69516 #la ligne des titres omis

#conversion type
d$Date<-as.Date(d$Date, format="%d/%m/%Y")
d$Time<-strptime(paste(d$Date,d$Time),format="%F %R")
for(i in 3:7){d[,i]<-as.numeric(d[,i])}

#------------ plot 1 ------------------------
png("plot1.png")
hist(d$Global_active_power,col="red", main="", xlab="")
title(main="Global active Power", xlab="Global active Power (kilowatts)")
dev.off()

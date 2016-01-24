## assumes .zip file household_power_consumption.txt is downloaded in the working directory

power<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?")
power$DateTime<- as.POSIXct(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")
power$Date<-as.Date(power$Date,format="%d/%m/%Y")
power$Time<- strptime(power$Time, format = "%H:%M:%S")
startdate<- as.Date("01/02/2007", format = "%d/%m/%Y")
enddate<- as.Date ("02/02/2007",format ="%d/%m/%Y")
pow2<- power[power$Date>= startdate & power$Date <=enddate,]


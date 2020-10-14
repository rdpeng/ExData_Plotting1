## Import file
data<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=F, na.strings="?")
## Create new datetime field which concatenates the date and time fields
datetime=strptime(paste(data$Date,data$Time),format="%e/%m/%Y %H:%M:%S")
##add new field to original data table
data<-cbind(data,datetime)
##Convert date field to data type of Date
data$Date<-as.Date(data$Date, format ="%e/%m/%Y")
##Filter data table by dates between 1/2/2007 and 2/2/2007
data2<-subset(data,Date >= as.Date("01/02/2007", format ="%e/%m/%Y") & Date <= as.Date("02/02/2007", format ="%e/%m/%Y") )

#plot2
par(mfrow=c(1,1))
plot(data2$Global_active_power ~ data2$datetime,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,"plot2.png",width=480,height=480)
dev.off()

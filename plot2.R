a<-read.table("ExData_Plotting1\\household_power_consumption.txt",sep=";", header=T,stringsAsFactors = F)
c<-as.Date(as.character(a[[1]]),"%d/%m/%Y")
e<-a["2007-02-01"==c|"2007-02-02"==c,]
t<-paste(e$Date,e$Time)
t<-strptime(t, format="%d/%m/%Y %H:%M:%S")
dev.copy(png,"plot2.png")
plot(t,as.numeric(e$Global_active_power), type ="l",xlab="",ylab = "Global Active Power (kilowatts)")
dev.off()
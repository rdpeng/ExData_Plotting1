
## reading the data
hpc<-read.table(file="household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors=FALSE)
hpc_new<-hpc[hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007",]


##Open png device and create file plot2.png in my working directory 
png(file="plot2.png",width = 480, height = 480)


##now let's make plot2, but first set the class of the data
datetime<-as.POSIXct(paste(hpc_new$Date,hpc_new$Time),format="%d/%m/%Y %H:%M:%S")
h<-as.numeric(paste(hpc_new$Global_active_power))

plot(datetime,h,type="l",xlab="",ylab = "Global Active Power (kilowatts)")


##Close png file device
dev.off()

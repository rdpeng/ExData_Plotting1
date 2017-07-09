
## reading the data
hpc<-read.table(file="household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors=FALSE)
hpc_new<-hpc[hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007",]


##Open png device and create file plot1.png in my working directory 
png(file="plot1.png",width = 480, height = 480)


##make a histogram, but first set the class of the data
h<-as.numeric(paste(hpc_new$Global_active_power))
hist(h,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")


##Close png file device
dev.off()

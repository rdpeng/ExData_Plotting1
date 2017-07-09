#import data
hpc <- read.table("household_power_consumption.txt",sep=";",header=TRUE,
                  na.strings = "?",stringsAsFactors=TRUE)
hpc$datetime <-  strptime(paste(hpc$Date,hpc$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
hpc_subset <- subset(hpc,as.Date(datetime)=="2007-02-01"|as.Date(datetime)=="2007-02-02")

#Plot2
plot(hpc_subset$datetime,hpc_subset$Global_active_power,xlab="",
     ylab="Global Active Power (kilowatts)",type="l")
dev.copy(png, file="plot2.png",height=480,width=480)
dev.off()
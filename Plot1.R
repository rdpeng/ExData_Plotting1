#import data
hpc <- read.table("household_power_consumption.txt",sep=";",header=TRUE,
                  na.strings = "?",stringsAsFactors=TRUE)
hpc$datetime <-  strptime(paste(hpc$Date,hpc$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
hpc_subset <- subset(hpc,as.Date(datetime)=="2007-02-01"|as.Date(datetime)=="2007-02-02")

#Plot1
hist(hpc_subset$Global_active_power,xlab="Global Active Power (kilowatts)",col="red",
     main=("Global Active Power"))
dev.copy(png, file="plot1.png",height=480,width=480)
dev.off()



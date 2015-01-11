dataset<-read.table(file="household_power_consumption.txt",sep=";",header=T)
df<-dataset[dataset$Date=="1/2/2007"|dataset$Date=="2/2/2007",]
rm(dataset)
gap<-as.numeric(levels(df$Global_active_power))[df$Global_active_power]
x <- paste(df$Date, df$Time)
df$x<-strptime(x, "%d/%m/%Y %H:%M:%S")
png(filename="plot2.png", width=480, height=480) 
plot(df$x,gap,ylab="Global Active Power (kilowatts)",type="l",xlab="") 
dev.off() 

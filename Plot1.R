dataset<-read.table(file="household_power_consumption.txt",sep=";",header=T)
df<-dataset[dataset$Date=="1/2/2007"|dataset$Date=="2/2/2007",]
gap<-as.numeric(levels(df$Global_active_power))[df$Global_active_power]
png(filename="plot1.png", width=480, height=480)    
hist(gap,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)") 
dev.off() 

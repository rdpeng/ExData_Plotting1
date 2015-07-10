#load prepared data
source('preparedData.r')

#plot 1
png("Plots/Plot1.png")
hist(Power.Subset$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()




